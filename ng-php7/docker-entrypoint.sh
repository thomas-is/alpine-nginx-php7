#!/bin/sh

sed -e "s/user = nobody/user = $PHP_UID/g" -i /etc/php7/php-fpm.d/www.conf
sed -e "s/group = nobody/group = $PHP_GID/g" -i /etc/php7/php-fpm.d/www.conf

if [ "$PHP_CLEAR_ENV" = "no" ] ; then
  sed -e 's/;clear_env/clear_env/g' -i /etc/php7/php-fpm.d/www.conf
fi

php-fpm7

exec "$@"
