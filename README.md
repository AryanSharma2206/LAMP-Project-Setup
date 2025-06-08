# 🚀 LAMP Stack Deployment on AWS Linux

This project showcases a full deployment of the **LAMP Stack (Linux, Apache, MySQL, PHP)** on an **AWS EC2 instance running Amazon Linux**, entirely set up by **Aryan Sharma**. It demonstrates hands-on DevOps skills and basic web hosting using cloud infrastructure.

---

## 🛠️ Tech Stack

- **Amazon Linux**
- **Apache HTTP Server**
- **MySQL Server**
- **PHP**
- **AWS EC2**
- **Shell Scripting**

---

## 📁 Project Structure

```
LAMP-on-AWS/
│
├── scripts/
│   ├── install_apache.sh
│   ├── install_mysql.sh
│   ├── install_php.sh
│   └── start_services.sh
│
├── index.php            # Sample PHP homepage
├── db_config.php        # MySQL database connection script
├── screenshot.png       # Project demo screenshot
├── README.md
```

---

## ⚙️ Steps to Deploy

### 1. Launch AWS EC2 Instance
- AMI: **Amazon Linux 2023**
- Instance type: **t2.micro**
- Open security group ports: **22 (SSH)**, **80 (HTTP)**

### 2. Connect to the Instance
```bash
ssh -i "your-key.pem" ec2-user@your-ec2-public-ip
```

### 3. Clone the Repository
```bash
sudo yum install git -y
git clone https://github.com/AryanSharma2206/LAMP-on-AWS.git
cd LAMP-on-AWS
```

### 4. Execute Installation Scripts
```bash
chmod +x scripts/*.sh
sudo ./scripts/install_apache.sh
sudo ./scripts/install_mysql.sh
sudo ./scripts/install_php.sh
sudo ./scripts/start_services.sh
```

### 5. Deploy the Website
```bash
sudo cp index.php /var/www/html/
sudo systemctl restart httpd
```

---

## 🌐 Access Webpage

Visit `http://your-ec2-public-ip` in your browser. You should see your sample PHP page running.

---

## ✅ Features

- Complete LAMP stack automation
- Apache + PHP serving dynamic content
- MySQL ready for database connections
- Modular and reusable shell scripts

---

**Aryan Sharma**  
B.Tech CSE (AI & DS) | Poornima University  
GitHub: [@AryanSharma2206](https://github.com/AryanSharma2206)  
LinkedIn: [linkedin.com/in/aryan-sharma2206](https://www.linkedin.com/in/aryan-sharma-a2a240353/)  
Location: Jaipur, India
---


