#!/bin/bash


#Git installation
echo "[DEBUG] Installing Git"
sudo yum install git -y
echo "[DEBUG] Done installing Git"


#Install MariaDB
echo "[DEBUG] installing MariaDB"
sudo yum install -y mariadb-server
sudo service mariadb start
sudo systemctl enable mariadb
echo "[DEBU] Done installing MariaDB"



#Install PHP
echo "[DEBUG] Installing PHP"
sudo amazon-linux-extras install php8.1 -y
sudo yum install php-dom -y
echo "[DEBUG] Done installing PHP"


#Install PHP-MySQL
echo "[DEBUG] Installing PHP-MYSQL"
sudo yum install -y php-mysql
echo "[DEBUG] Done installing PHP-MYSQL"


#Install Apache server
echo "[DEBUG] Installing Apache server"
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "[DEBUG] Done installing Apache server"

echo "[DEBUG] -> Fundamental components setup is done"

#Check if the deploy file exist
FILE_PATH=./deploy-testing-server.sh

if [ -f "$FILE_PATH" ]; then

        echo "[DEBUG] deploy-testing-server.sh file found !"
        echo "[DEBUG] executing deploying file"
        bash deploy-testing-server.sh

else
        echo "[DEBUG] deploy-testing-server.sh is not existed !"

fi