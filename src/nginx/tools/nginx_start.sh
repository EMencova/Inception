
# Create the SSL directory if it doesn't exist
mkdir -p /etc/nginx/ssl

# Generatint a self-signed SSL certificate (if not present)
if [ ! -f /etc/nginx/ssl/vbachele.crt ] || [ ! -f /etc/nginx/ssl/vbachele.key ]; then
    echo "Generating SSL certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/vbachele.key \
        -out /etc/nginx/ssl/vbachele.crt \
        -subj "/C=XX/ST=XX/L=XX/O=XX/OU=XX/CN=vbachele.42.fr"
fi

# Start Nginx
nginx -g "daemon off;"
