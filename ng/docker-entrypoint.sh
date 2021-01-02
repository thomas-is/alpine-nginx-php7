#!/bin/sh

sed -e 's/user nginx/user root/g' -i /etc/nginx/nginx.conf

/usr/local/bin/ng-conf-monitor.sh &

exec "$@"
