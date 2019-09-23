#!/bin/bash

# This script is intended for use in development only. It is not optimized or secure for production use.

# Config
export PASSWORD=1234

# Apache
sudo apt-get -y install apache2
sudo chmod a+rwx /var/www/html # we might want to replace this with group permissions
sudo sh -c 'echo "<Directory /var/www/html/>\n	Options +FollowSymLinks\n	AllowOverride All\n</Directory>" > /etc/apache2/conf-available/devbox-apache.conf'
sudo a2enconf devbox-apache
sudo a2enmod rewrite

# Mysql
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server php-mysql

# Emulate mysql_secure_installation
mysql -u root -p"$PASSWORD" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"$PASSWORD" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"$PASSWORD" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"$PASSWORD" -e "FLUSH PRIVILEGES"

# PHP
sudo apt-get -y install php libapache2-mod-php php-mcrypt # can we move php-mcrypt?
sudo sh -c 'echo "<IfModule mod_dir.c>\n    DirectoryIndex index.php index.html\n</IfModule>" > /etc/apache2/conf-available/devbox-php.conf'
sudo a2enconf devbox-php
sudo rm /var/www/html/index.html
sudo sh -c 'echo "<?php phpinfo();" > /var/www/html/index.php'

# PHP extensions
sudo apt-get -y install php-xdebug
sudo apt-get -y install php-apc
sudo apt-get -y install php-pear
sudo apt-get -y install php-intl
sudo apt-get -y install php-mbstring
sudo apt-get -y install php-gettext
sudo apt-get -y install php-curl
sudo apt-get -y install php-soap

# phpMyAdmin
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-user string root"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo apt-get -y install phpmyadmin
sudo systemctl restart apache2

# Finished
echo "Finished"
