#!/bin/sh

if [ "$PHP_USER" != "" ] ; then
  echo "PHP_USER is deprecated, use FPM_USER instead"
  export FPM_USER="$PHP_USER"
fi
if [ "$PHP_CLEAR_ENV" != "" ] ; then
  echo "PHP_CLEAR_ENV is deprecated, use FPM_CLEAR_ENV instead"
  export FPM_CLEAR_ENV="$PHP_CLEAR_ENV"
fi

if [ "$FPM" = "enabled" ] ; then

  sed -e "s/user = nobody/user = $FPM_USER/g" -i /etc/php8/php-fpm.d/www.conf
  sed -e "s/group = nobody/group = $FPM_USER/g" -i /etc/php8/php-fpm.d/www.conf

  if [ "$FPM_CLEAR_ENV" = "no" ] ; then
    sed -e 's/;clear_env/clear_env/g' -i /etc/php8/php-fpm.d/www.conf
  fi

  php-fpm8 --allow-to-run-as-root

fi

exec "$@"
