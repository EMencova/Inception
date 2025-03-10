
-- Create WordPress database if it doesn't exist
CREATE DATABASE IF NOT EXISTS wordpress;

-- Create  WordPress user with .env file
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';

-- Grant all privileges to user 
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';

-- Create the root user with .env file
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root';

-- Grant privileges to root user
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;


