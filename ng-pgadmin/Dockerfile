FROM alpine

RUN apk update \
&&  apk upgrade \
&&  apk add \
  ca-certificates git \
  nginx php7-fpm \
  php7-session \
  php7-pgsql \
  php7-mbstring 

RUN rm -rf /var/cache/apk/* \
&&  mkdir /run/nginx

RUN cd /srv \
&&  git clone https://github.com/phppgadmin/phppgadmin

COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./srv/phppgadmin/conf /srv/phppgadmin/conf

CMD php-fpm7 && /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;" 
