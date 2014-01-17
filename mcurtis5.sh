#!/bin/bash
yum update -y
yum groupinstall -y "Web Server" "MySQL Database" "PHP Support"
yum install -y httpd
yum install -y php-mysql
service httpd start
chkconfig httpd on
groupadd www
usermod -a -G www ec2-user
chown -R root:www /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} +
find /var/www -type f -exec chmod 0664 {} +
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
echo "<html><head><title>Mike Curtis</title></head><body><h1>Mike Curtis</h1></body></html>" > /var/www/html/index.html
