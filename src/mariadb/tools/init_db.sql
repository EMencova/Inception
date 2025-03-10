-- init_db.sql

-- Create the WordPress database if it doesn't exist
CREATE DATABASE IF NOT EXISTS wordpress;

-- Create the WordPress user with the credentials from the .env file
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';

-- Grant all privileges to the WordPress user on the created database
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';

-- Create the root user with the password from the .env file
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root';

-- Grant privileges to the root user
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

-- Flush privileges to apply changes
FLUSH PRIVILEGES;


