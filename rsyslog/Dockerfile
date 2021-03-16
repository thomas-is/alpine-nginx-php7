ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add ca-certificates rsyslog rsyslog-imdocker

RUN rm -rf /var/cache/apk/*

COPY ./rsyslog.conf /etc/rsyslog.conf
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 514 601
ENTRYPOINT [ "docker-entrypoint.sh" ]
# https://linux.die.net/man/8/rsyslogd
CMD [ "/usr/sbin/rsyslogd", "-n" ]
