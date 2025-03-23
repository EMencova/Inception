FROM alpine:3.20.6

ARG PHP_VERSION=82
ARG DB_NAME
ARG DB_USER
ARG DB_PASS

# Promote build-time variables to runtime environment variables:
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASS=${DB_PASS}
ENV DB_ROOT=${DB_ROOT}

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php82/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php82/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

# Create a directory for scripts
RUN mkdir -p /scripts

# Copy the configuration script to /scripts (not /var/www)
COPY ./requirements/wordpress/conf/wp-config-create.sh /scripts/
RUN chmod +x /scripts/wp-config-create.sh

WORKDIR /var/www

# Copy entrypoint script
COPY ./requirements/wordpress/conf/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm82", "-F"]
