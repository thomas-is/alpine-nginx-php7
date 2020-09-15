#!/bin/sh

sed -i -e "s/\${SSL_DOMAIN}/$SSL_DOMAIN/g" /etc/nginx/conf.d/default.conf
sed -i -e "s/\${SSL_DOMAIN}/$SSL_DOMAIN/g" /etc/crontabs/root

crond -f -l 8 &

exec "$@"
