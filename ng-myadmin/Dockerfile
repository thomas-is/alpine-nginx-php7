FROM alpine

RUN apk update \
&&  apk upgrade \
&&  apk add \
  ca-certificates \
  nginx php7-fpm \
  phpmyadmin

RUN rm -rf /var/cache/apk/* \
&&  mkdir /run/nginx

COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./etc/phpmyadmin/config.inc.php /etc/phpmyadmin/config.inc.php
RUN chmod 644 /etc/phpmyadmin/config.inc.php

CMD php-fpm7 && /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;" 
