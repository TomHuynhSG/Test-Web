# COSC2767 Assignment 3
```
# RMIT University Vietnam
#  Course: COSC2767 Systems Deployment and Operations
#  Semester: 2023C
#  Assessment: Assignment 3
#  Author - ID: Do Le Long An - s3963207, La Tran Hai Dang - s3836605, Pham Quang Man - s3804811, Huynh Van Anh - s3836320, Hoang Ngoc Duan - s3817747
#  Created date: 06/01/2024
#  Last modified: 21/01/2024
#  Acknowledgement: RMIT Canvas, ChatGPT, AWS Documentation, StackOverflow,
#  AWSAcademy Learner Lab, GitHub Documentation, Docker Documentation
#  ngrok Documentation, Jenkins Documentation

# VIDEO DEMONSTRATION LINK: https://youtu.be/WmzPL43t688
# GITHUB REPO: https://github.com/RMIT-DevOps-Hackathon/COSC2767-RMIT-Store
```
# CI/CD Pipeline on local
- Refer to [utilities README.md](./utilities/README.md)
# RMIT Store 🛍️
<p align="center">
    <img src="https://i.imgur.com/e6H7HA3.jpg" width=900>
</p>

This is the RMIT Store built on the classic but still popular LAMP stack (Linux, Apache, MySQL, PHP).

Here is the instructions to setup the website on CentOS/Linux EC2 instance:

## 📙 1. MariaDB/MySQL Database

You need to install a relational database installed to store and manage your data.

MariaDB is the fork of MySQL Database. The usage and syntax is the same between MariaDB and MySQL. 

AWS recommends to use MariaDB instead of MySQL as MariaDB comes with numerous inbuilt powerful features and many usabilities, security and performance improvements that you cannot find in MySQL.
```
sudo yum install -y mariadb-server
sudo service mariadb start
sudo systemctl enable mariadb
```
MariaDB or MySQL listens to the default port number 3306.

## 📜 2. Run SQL Script

Open MariaDB console and run these SQL script to populate the database user, create database "rmit_store_db", the table "store" and populate rows in the table.

The commands below initiate a session as a superuser in MySQL (or MariaDB), then create a new user named 'db_admin' with full privileges on all databases and tables. 
Following this, a new database called 'rmit_store_db' is created and a 'store' table is set up with various fields. 
Finally, multiple products with details like name, price, and image URL are inserted into the 'store' table before exiting the session.

```
$ sudo mysql

MariaDB > CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'rmit_password';
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'db_admin'@'localhost';
MariaDB > FLUSH PRIVILEGES;

MariaDB > CREATE DATABASE rmit_store_db;
MariaDB > USE rmit_store_db;

MariaDB > CREATE TABLE store (id mediumint(8) unsigned NOT NULL auto_increment, Name varchar(255) default NULL, Price varchar(255) default NULL, ImageUrl varchar(255) default NULL, PRIMARY KEY (id)) AUTO_INCREMENT = 1;
MariaDB > INSERT INTO store (Name, Price, ImageUrl) VALUES ("Fairtrade Pocket Hoodie", "64.95", "p-1.jpg"), ("Fairtrade Zip Hoodie", "59.95", "p-2.jpg"), ("Rudby Jergy", "69.95", "p-3.jpg"), ("Topaz Premium Zip Jacket", "34.95", "p-4.jpg"), ("Rmit Fairtrade Polo", "21.95", "p-5.jpg"), ("Portable Charger", "10", "p-6.jpg"), ("Face Mask", "8.5", "p-7.jpg"), ("Hoddie Koala", "30", "p-8.jpg"), ("Graduation Redbacks Pack", "59.95", "p-9.jpg"), ("Vinyl Pixel Keyring", "7.95", "p-10.jpg"), ("Applied Science Course Kit", "79.95", "p-11.jpg"), ("Graduation Tie", "79.99", "p-12.jpg");

MariaDB > exit
```
Note: Notice the "localhost" and change it accordingly if the database is not in the same server with Apache! For a simple setup for one server hosting both web server and database, then leave it be.

## ⚙️ 3. Install PHP and php-mysql module

PHP is the scripting language of our setup that will process code to display dynamic content to the user. 

In addition to the php package, you’ll need php-mysql, a PHP module that allows PHP to communicate with MySQL-based databases.
```
sudo yum install -y php php-mysql
```

## 🛠️ 4. Install Apache server

You need to install Apache server to serve your content.
```
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
```

## 💡 5. Git clone the website from Github to the root folder of Apache

You need to fork/copy/download this Github repo first to your Github account.

You need to install git and git clone the github repo to the directory "/var/www/html/" as it is the default root folder of the Apache web server.
```
sudo yum install -y git
sudo git clone <your-git-repo-url> /var/www/html/
```

In the file index.php located in the website directory, we got this PHP script to connect to the MariaDB database.
```
$link = mysqli_connect(
    "localhost",
    "db_admin",
    "rmit_password",
    "rmit_store_db"
);
```
Note: Notice the "localhost" and change it accordingly if the database is not in the same server with Apache!

## 💻 6. Open the website

Open the website via the public IP address or the domain name via the default port http 80!

Behold, it's time to buy some RMIT glorious merchandise!
<img src="https://i.imgur.com/YBUd8Ol.png">

Profit💸💰! Sweet and simple to deploy this website!

## 🏆 Author
- Huynh Nguyen Minh Thong (Tom Huynh) - tomhuynhsg@gmail.com
