#!/bin/sh

# PGA config
sed -e "s/\${PGA_SERVERS}/$PGA_SERVERS/g" -i /srv/conf/config.inc.php

php-fpm7

exec "$@"
