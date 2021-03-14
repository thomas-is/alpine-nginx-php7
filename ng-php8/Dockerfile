ARG ALPINE=latest

FROM alpine:$ALPINE

ENV FPM_USER      nobody
ENV FPM_CLEAR_ENV yes

RUN apk update && apk upgrade && \
  apk add ca-certificates nginx php8 php8-fpm \
  php8-curl \
  php8-iconv \
  php8-json \
  php8-mbstring \
  php8-openssl \
  php8-pdo php8-pdo_mysql php8-pdo_pgsql \
  php8-session

RUN ln -s /usr/bin/php8 /usr/bin/php

RUN rm -rf /var/cache/apk/*
RUN mkdir -p /run/nginx

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

COPY ./ng-default.conf /etc/nginx/conf.d/default.conf
COPY ./srv /srv

WORKDIR /srv

EXPOSE 80

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
