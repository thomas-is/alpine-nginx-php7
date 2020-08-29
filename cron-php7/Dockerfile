FROM alpine

ENV CRONTAB "* * * * * echo TICK"

RUN apk update && apk upgrade && \
  apk add ca-certificates php7 \
  php7-curl \
  php7-iconv \
  php7-json \
  php7-mbstring \
  php7-openssl \
  php7-pdo php7-pdo_mysql php7-pdo_pgsql \
  php7-pecl-ssh2 \
  php7-session

RUN rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "crond", "-f", "-l", "8" ]
