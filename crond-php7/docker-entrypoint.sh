#!/bin/sh

echo -e "$CRONTAB\n" > /etc/crontabs/root

exec "$@"
