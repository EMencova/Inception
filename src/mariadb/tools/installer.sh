
#creating init.sql script with necessary SQL commands
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

# necessary directory exists
mkdir -p /run/mysqld

# Start MariaDB
exec mysqld
