FROM alpine

RUN apk update &&  apk upgrade 
RUN apk add ca-certificates git nginx php7-fpm php7-session php7-pgsql php7-mbstring 
RUN rm -rf /var/cache/apk/* 

RUN mkdir /run/nginx
RUN git clone https://github.com/phppgadmin/phppgadmin /srv

COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./srv/conf/config.inc.php /srv/conf/config.inc.php

CMD php-fpm7 && /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;" 
