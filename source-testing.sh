sudo su

sudo mysql <sql/setup-script.sql

mv src/* /var/www/html/
cd /var/www/html
/usr/local/bin/composer install
/usr/local/bin/composer require --dev phpunit/phpunit

# Testing commands
./vendor/bin/phpunit --log-junit /home/ec2-user/log/test-results.xml tests/
