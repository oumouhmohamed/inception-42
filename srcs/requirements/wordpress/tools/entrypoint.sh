#!/bin/bash

SQL_PASS=$(cat /run/secrets/db_pass)

until mysqladmin ping -h mariadb -u ${SQL_USER} -p${SQL_PASS} --silent; do
    sleep 2
done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp core download --allow-root
    wp config create --dbname=$SQL_DB --dbuser=$SQL_USER --dbpass=$SQL_PASS --dbhost=mariadb --allow-root
    wp core install --url=https://$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
    wp user create $USER1_LOGIN $USER1_MAIL --role=author --user_pass=$USER1_PASS --allow-root
    
    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    wp redis enable --allow-root
fi

mkdir -p /run/php
chown -R www-data:www-data /var/www/wordpress
chmod -R 775 /var/www/wordpress

exec /usr/sbin/php-fpm8.2 -F
