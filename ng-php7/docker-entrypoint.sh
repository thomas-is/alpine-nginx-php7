#!/bin/sh

if [ "$PHP_CLEAR_ENV" = "no" ] ; then
  sed -e 's/;clear_env/clear_env/g' -i /etc/php7/php-fpm.d/www.conf
fi

php-fpm7

exec "$@"
