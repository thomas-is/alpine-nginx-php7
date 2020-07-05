#!/bin/sh

certbot certonly --standalone --non-interactive --agree-tos \
  -m $CERTBOT_MAIL \
  -d $CERTBOT_DOMAIN

sed -i -e "s/\${CERTBOT_DOMAIN}/$CERTBOT_DOMAIN/g" /etc/nginx/conf.d/default.conf

exec "$@"
