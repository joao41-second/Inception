
cd ..
wget https://wordpress.org/latest.tar.gz
chown -R www-data:www-data /wordpress
chmod -R 755 /wordpress
tar -xzf latest.tar.gz
echo estou em "$pwd"
cd wordpress

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



exec php -S 0.0.0.0:9000
