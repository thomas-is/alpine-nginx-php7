FROM alpine

RUN apk update && apk upgrade && \
  apk add ca-certificates ssmtp

RUN rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
COPY revaliases /etc/ssmtp/revaliases

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "tail", "-f", "/dev/null" ]
