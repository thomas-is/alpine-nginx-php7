#!/bin/sh

printf "# m	h	d	M	w	command\n  0	4	*	*	*	certbot renew --nginx -n\n\n" > /etc/crontabs/root

crond -f -l 8 &

exec "$@"
