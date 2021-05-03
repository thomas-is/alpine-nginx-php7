#!/bin/sh

if [ "$(id -u)" = 0 ] ; then
  sed -e "s/user = nobody/user = $FPM_USER/g" -i /etc/php7/php-fpm.d/www.conf
  sed -e "s/group = nobody/group = $FPM_USER/g" -i /etc/php7/php-fpm.d/www.conf
  sed -e 's/;clear_env/clear_env/g' -i /etc/php7/php-fpm.d/www.conf
fi

exec "$@"
