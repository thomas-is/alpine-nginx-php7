#!/bin/sh

sed -i -e "s/\${SSL_DOMAIN}/$SSL_DOMAIN/g" /etc/nginx/conf.d/default.conf

crond -f -l 8 &

exec "$@"
