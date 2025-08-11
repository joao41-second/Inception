!/bin/sg

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql

	
	echo "ok"

 mariadb-install-db \
  --user=mysql \
  --basedir=/usr \
  --skip-name-resolve \

 tempfile=$(mktemp)

cat << EOF > $tempfile
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';
CREATE DATABASE IF NOT EXISTS \`${WP_DATABASE_NAME}\` CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS '${WP_DATABASE_USR}'@'%' IDENTIFIED BY '${WP_DATABASE_PWD}';
GRANT ALL PRIVILEGES ON \`${WP_DATABASE_NAME}\`.* TO '${WP_DATABASE_USR}'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}' WITH GRANT OPTION;
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF
  
cat $tempfile 
mysqld --user=mysql --bootstrap --verbose=0 --skip-networking=0 < "$tempfile"

exec mysqld --user=mysql --console

