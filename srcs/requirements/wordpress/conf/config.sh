
cd ..
wget https://wordpress.org/latest.tar.gz
chown -R www-data:www-data /wordpress
chmod -R 755 /wordpress
tar -xzf latest.tar.gz
echo estou em "$pwd"
cd ./html

sleep 3
echo login int mariadb...
if ! mysql -h mariadb -u $WP_DATABASE_USR -p$WP_DATABASE_PWD -e "USE $WP_DATABASE_NAME;" 2>/dev/null; then
   
    echo "ERROR: Database $WP_DATABASE_NAME without access!"

    exit 1
fi
echo login na base de dados excutado 

echo root the download

wp core download --allow-root

echo create the config wordpress...

    wp config create \
        --dbname=$WP_DATABASE_NAME \
  	--dbuser=$WP_DATABASE_USR \
  	--dbpass=$WP_DATABASE_PWD \
        --dbhost=mariadb \
        --allow-root


echo "Installing WordPress..."
    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PWD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email \
        --allow-root

	wp config set WP_HOME "https://$DOMAIN_NAME"  --type=constant --allow-root
	wp config set WP_SITEURL "https://$DOMAIN_NAME"  --type=constant --allow-root
echo "add user" 
   wp user create \
        $WP_USR $WP_EMAIL \
        --role=author \
        --user_pass=$WP_PWD \
        --allow-root

echo "config option"

   wp option update blogdescription "42 School Inception Project" --allow-root
   wp option update permalink_structure "/%postname%/" --allow-root
   wp theme install twentytwentyone --activate --allow-root

echo "php config"


echo  "Configurating PHP-FPM..."
sed -i 's/listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;listen.owner = .*/listen.owner = www-data/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;listen.group = .*/listen.group = www-data/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/;listen.mode = .*/listen.mode = 0660/' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php && chown www-data:www-data /run/php

echo "start the php"
exec php-fpm7.4 -F

#exec php -S 0.0.0.0:9000
