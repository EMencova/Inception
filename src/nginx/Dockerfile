FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

# Expose port 443 for SSL
EXPOSE 443

COPY ./conf/default.conf /etc/nginx/sites-enabled/default


# Copy the script to start Nginx
COPY ./tools/nginx_start.sh /usr/local/bin/

# Make sure the script is executable
RUN chmod +x /usr/local/bin/nginx_start.sh

# Set the entrypoint to start Nginx
ENTRYPOINT ["/usr/local/bin/nginx_start.sh"]
CMD ["nginx", "-g", "daemon off;"]

