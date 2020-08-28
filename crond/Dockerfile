FROM alpine

ENV CRONTAB "* * * * * echo TICK"

RUN apk update && apk upgrade && \
  apk add ca-certificates

RUN rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "crond", "-f", "-l", "8" ]
