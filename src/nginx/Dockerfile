FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl

# Exposing port 443 for SSL
EXPOSE 443

COPY ./conf/default.conf /etc/nginx/sites-enabled/default


# Copying the script to start Nginx
COPY ./tools/nginx_start.sh /usr/local/bin/

# Making sure script is executable
RUN chmod +x /usr/local/bin/nginx_start.sh

# Setting the entrypoint to start Nginx
ENTRYPOINT ["/usr/local/bin/nginx_start.sh"]
CMD ["nginx", "-g", "daemon off;"]

