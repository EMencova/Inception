FROM debian:buster

# Install essential packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    bash \
    php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd \
    php-cli \
    php-mbstring \
    redis \
    php-redis \
    && rm -rf /var/lib/apt/lists/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy PHP-FPM configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Create the folder for PHP-FPM to run
RUN mkdir /run/php

# Copy and set executable permissions for the WordPress setup script
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

# Set entry point to run the WordPress setup script
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

# Set working directory to HTML directory
WORKDIR /var/www/html/

# Expose port for PHP-FPM
EXPOSE 9000

# Start PHP-FPM in foreground
CMD ["/usr/sbin/php-fpm7.3", "-F"]
