#!/bin/bash

# Set the permissions on the /var/www/html directory to ensure we can write to it
chmod -R 755 /var/www/html

# Download WordPress
cd /var/www/html
wp core download --allow-root

# Configure the wp-config.php file with database credentials from environment variables
wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root

# Install WordPress with the admin credentials and site details
wp core install --url=$DOMAIN_NAME --title="My WordPress Site" --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

# Create a new user for the site
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

# Install and activate the Redis plugin for WordPress
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# Set correct file permissions
chown -R www-data:www-data /var/www/html

# Keep the container running
tail -f /dev/null
