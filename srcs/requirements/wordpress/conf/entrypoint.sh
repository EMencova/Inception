#!/bin/sh
set -e

echo "Environment variables:"
echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASS: $DB_PASS"
echo "DB_ROOT: $DB_ROOT"

# Check if files are missing
if [ ! -f "/var/www/wp-settings.php" ]; then
  echo "WordPress files not found. Downloading..."
  wget https://wordpress.org/latest.tar.gz -P /tmp
  tar -xzf /tmp/latest.tar.gz -C /tmp
  rm -rf /var/www/*
  mv /tmp/wordpress/* /var/www/
  rm -rf /tmp/latest.tar.gz /tmp/wordpress
  echo "WordPress downloaded to /var/www/"
fi

# if missing
if [ ! -s "/var/www/wp-config.php" ]; then
  echo "Generating wp-config.php..."
  sh /scripts/wp-config-create.sh
  echo "wp-config.php generated."
fi

# Set permissions 
chown -R chown -R www-data:www-data /var/www

chmod -R 755 /var/www

exec "$@"
