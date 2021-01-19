#!/bin/sh

sed -e "s/user nginx/user $NG_USER/g" -i /etc/nginx/nginx.conf

/usr/local/bin/ng-conf-monitor.sh &

exec "$@"
