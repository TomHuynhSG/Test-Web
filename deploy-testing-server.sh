#!/bin/bash

#Clone the github repo into /var/www/html
WEB_APP_PATH=/var/www/html

echo "[DEBUG] cloning repo"
cd ~
git clone https://github.com/KhangLeonardo/COSC2767-RMIT-Store.git
echo "[DEBUG] git clone is done !"

#Copy the src into /var/www/html, -r to include files and sub-directories
echo "[DEBUG] copying content of /src into /var/www/html"
cp -r ./COSC2767-RMIT-Store/src/* $WEB_APP_PATH
echo "[DEBUG] done copying web app content"



#[EXECUTING QUERY]
#Run the SQL script
SQL_SCRIPT_FILE=~/COSC2767-RMIT-Store/sql/setup-script.sql
#Check if the sql file exist
if [ -f "$SQL_SCRIPT_FILE" ]; then

        #Enter mysql mode and execute file
        echo "[DEBUG] Executing SQL script"
        mysql -u root < $SQL_SCRIPT_FILE
        echo "[DEBUG] Done executing SQL script"


else

        echo "[DEBUG] sql file not found !"
fi



#Going into /var/www/html
cd /var/www/html
echo "[DEBUG] current at /var/www/html"

#Restart httpd server
echo "[DEBUG] restarting apache server"
service httpd restart
echo "[DEBUG] apache server restarted !"



#[COMPOSER FOR PHPUNIT]

echo "[DEBUG] Installing Composer and PHPUnit"

sudo yum install php-cli php-json php-common php-mbstring wget -y
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

echo "[DEBUG] Done installing Composer"



echo "[DEBUG] Going into composer.json location"
cd /var/www/html
echo "[DEBUG] is at /var/www/html"


echo "[DEBUG] Installing PHPUnit dependency"
composer require --dev phpunit/phpunit ^10
echo "[DEBUG] Done intalling PHPUnit dependency"

echo "[DEBUG] running test cases"
./vendor/bin/phpunit ./tests/PHPQueryTest.php
echo "[DEBUG] Testing server is OK !"