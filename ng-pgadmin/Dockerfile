FROM alpine

ENV PGA_SERVERS '{"0":{"desc":"Local Host","host":"localhost","port":"5432"}}'
RUN apk update &&  apk upgrade
RUN apk add ca-certificates git nginx postgresql-client php7-fpm php7-session php7-pgsql php7-mbstring php7-json
RUN rm -rf /var/cache/apk/*

RUN mkdir /run/nginx
RUN git clone https://github.com/phppgadmin/phppgadmin /srv

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

COPY ng-default.conf /etc/nginx/conf.d/default.conf
COPY pg-conf.php /srv/conf/config.inc.php

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
