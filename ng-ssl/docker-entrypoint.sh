#!/bin/sh

# nginx conf
sed -i -e "s/\${SSL_DOMAIN}/$SSL_DOMAIN/g" /etc/nginx/conf.d/default.conf

exec "$@"
