#!/bin/sh

# PMA config
sed -e "s/\${PMA_SERVERS}/$PMA_SERVERS/g" -i /etc/phpmyadmin/config.inc.php

php-fpm7

exec "$@"
