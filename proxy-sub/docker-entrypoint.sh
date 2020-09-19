#!/bin/sh

printf "# m	h	d	M	w	command\n  0	4	*	*	*	certbot renew --nginx -n " > /etc/crontabs/root

IFS=','

for SUBDOMAIN in $VHOSTS
do
  printf "-d $SUBDOMAIN.$DOMAIN " >> /etc/crontabs/root
  cat /tmp/ng-entry.conf \
  | sed -e "s/\${DOMAIN}/$DOMAIN/g" \
  | sed -e "s/\${SUBDOMAIN}/$SUBDOMAIN/g" \
  >> /etc/nginx/conf.d/default.conf
done

printf "\n\n" >> /etc/crontabs/root

crond -f -l 8 &

exec "$@"
