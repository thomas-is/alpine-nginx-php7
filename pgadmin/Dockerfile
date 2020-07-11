FROM alpine

ENV PGA_SERVERS "localhost" 

RUN apk update &&  apk upgrade
RUN apk add ca-certificates git nginx postgresql-client php7-fpm php7-session php7-pgsql php7-mbstring
RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx
COPY ng-default.conf /etc/nginx/conf.d/default.conf

RUN git clone https://github.com/phppgadmin/phppgadmin /srv
COPY pg-conf.php /srv/conf/config.inc.php

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
