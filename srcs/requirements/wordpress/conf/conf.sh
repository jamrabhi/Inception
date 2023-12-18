#!/bin/sh


if [ -f "/var/www/jamrabhi/wordpress/wp-config.php" ]
then 

sleep 5

else

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 15
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root --version=6.4 --path=/var/www/jamrabhi/wordpress --locale=fr_FR
cd /var/www/jamrabhi/wordpress
wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost="mariadb"
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${SQL_USER} --admin_password=${SQL_PASSWORD} --admin_email=${WP_EMAIL} --skip-email
wp user create --allow-root ${WP_EDITOR_LOGIN} ${WP_EDITOR_MAIL} --role=${WP_EDITOR_ROLE} --user_pass=${WP_EDITOR_PASS}

fi

exec /usr/sbin/php-fpm7.4 -F
