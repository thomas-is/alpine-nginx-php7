ARG ALPINE=latest

FROM alpine:$ALPINE

ENV FPM_USER      nobody
ENV FPM_CLEAR_ENV yes

RUN apk update && apk upgrade && \
  apk add ca-certificates nginx php7 php7-fpm \
  php7-curl \
  php7-iconv \
  php7-json \
  php7-mbstring \
  php7-openssl \
  php7-pdo php7-pdo_mysql php7-pdo_pgsql \
  php7-pecl-ssh2 \
  php7-session

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
