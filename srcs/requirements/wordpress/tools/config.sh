
set -a
for secret in /run/secrets/*; do
  # Se for ficheiro legível, "source" nele
  if [ -f "$secret" ]; then
    . "$secret"
  fi
done
set +a
exec "$@"

cd ..

curl -I https://wordpress.org/latest.tar.gz
chown -R www-data:www-data ./html
chmod -R 755 ./html
tar -xzf latest.tar.gz
cd ./html

sleep 3
echo login int mariadb...
if ! mysql -h mariadb -u $WP_DATABASE_USR -p$WP_DATABASE_PWD -e "USE $WP_DATABASE_NAME;" 2>/dev/null; then
   
    echo "ERROR: Database $WP_DATABASE_NAME without access!"

    exit 0
fi
echo login to the databe was successful

echo start  download root files

if [ -d "wp-admin" ] && [ -d "wp-includes" ]; then
	echo INFO: The core privios install
else
	echo INFO: Start instal core
	wp core download --allow-root
fi

echo create the config wordpress...

if [ -e "wp-config.php" ]; then 
	echo "INFO: The file exit not config new file "
else
	echo "INFO:Create new file wp-config.php"
    wp config create \
        --dbname=$WP_DATABASE_NAME \
  	--dbuser=$WP_DATABASE_USR \
  	--dbpass=$WP_DATABASE_PWD \
        --dbhost=mariadb \
        --allow-root
fi


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

for secret in /run/secrets/*; do
  if [ -f "$secret" ]; then
    while IFS='=' read -r key value; do
      [ -z "$key" ] && continue
      case "$key" in \#*) continue ;; esac
      unset "$key"
    done < "$secret"
  fi
done

exec "$@" 
exec php-fpm7.4 -F

#exec php -S 0.0.0.0:9000
