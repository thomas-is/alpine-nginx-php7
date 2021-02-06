ARG ALPINE=latest

FROM alpine:$ALPINE

ENV PMA_SERVERS "localhost"

RUN apk update && apk upgrade
RUN apk add ca-certificates nginx php7-fpm phpmyadmin
RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx
COPY ng-default.conf /etc/nginx/conf.d/default.conf

COPY my-conf.php /etc/phpmyadmin/config.inc.php
RUN chmod 644 /etc/phpmyadmin/config.inc.php

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
