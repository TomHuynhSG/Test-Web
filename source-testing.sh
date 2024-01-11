sudo su

sudo mysql <sql/setup-script.sql

mv src/* /var/www/html/
mv composer.json /var/www/html/composer.json
mv composer.lock /var/www/html/composer.lock
mv tests /var/www/html/tests

cd /var/www/html
/usr/local/bin/composer install
/usr/local/bin/composer require --dev phpunit/phpunit


# Testing commands
vendor/bin/phpunit --log-junit test-results.xml tests/
