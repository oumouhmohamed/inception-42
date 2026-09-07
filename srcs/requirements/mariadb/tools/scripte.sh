#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	#bootstrap run mysqld in special initialization mode to setup SQL before mariadb starts.
    mysqld --user=mysql --bootstrap << EOF
	FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
		CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
		CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
		GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;
EOF
fi
mkdir -p /run/mysqld
#changes file or directory ownership
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
#--console keeps its messages attached to the container console
exec mysqld --user=mysql --console --port=3306 --bind-address=0.0.0.0
