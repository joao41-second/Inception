
cd ..
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
echo estou em "$pwd"
cd wordpress
exec php -S 0.0.0.0:9000
