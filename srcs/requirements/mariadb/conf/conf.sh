#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]
then 

service mariadb start
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%'"
mysql -e "FLUSH PRIVILEGES"
mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
sleep 5

fi

exec mysqld -u root
