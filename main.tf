provider "aws" {
  region = "ap-south-1"
}

# Generate SSH key locally
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair using the public key
resource "aws_key_pair" "generated_key_pair" {
  key_name   = "lamp-key-${timestamp()}"
  public_key = tls_private_key.generated_key.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
  filename = "${path.module}/lamp-key.pem"
  content  = tls_private_key.generated_key.private_key_pem
  file_permission = "0400"
}

resource "aws_security_group" "lamp_sg" {
  name        = "lamp_sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "lamp_ec2" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 for ap-south-1
  instance_type = "t2.micro"
  key_name      = aws_key_pair.generated_key_pair.key_name
  user_data = file("${path.module}/lamp_setup.sh")

  vpc_security_group_ids = [aws_security_group.lamp_sg.id]

  tags = {
    Name = "lamp-ec2-auto"
  }
}

