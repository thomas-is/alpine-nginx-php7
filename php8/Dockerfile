ARG ALPINE=latest

FROM alpine:$ALPINE

ENV FPM_USER nobody

RUN apk update && apk upgrade && \
  apk add ca-certificates php8 php8-fpm \
  php8-curl \
  php8-iconv \
  php8-json \
  php8-mbstring \
  php8-openssl \
  php8-pdo php8-pdo_mysql php8-pdo_pgsql \
  php8-session

RUN rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/php8 /usr/bin/php

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/php-fpm8", "-F", "-R" ]
