FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

# Expose port 3306 for MySQL
EXPOSE 3306

# Starting MariaDB  and running SQL commands for init setup
COPY ./tools/init_db.sql /var/www/

RUN service mysql start && mysql < /var/www/init_db.sql && rm -f /var/www/init_db.sql

CMD ["mysqld"]

