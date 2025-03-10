
# Setting permissions on the /var/www/html directory (so we can write to it)
chmod -R 755 /var/www/html

# Downloading WordPress
cd /var/www/html
wp core download --allow-root

# Configuring the wp-config.php file with database credentials from env vars
wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root

# Installing WordPress with the admin credentials and site details
wp core install --url=$DOMAIN_NAME --title="My WordPress Site" --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

# Creating new user for the site
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

# Installing and activating the Redis plugin for WordPress
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# Setting correct file permissions
chown -R www-data:www-data /var/www/html

# Keeping the container running
tail -f /dev/null
