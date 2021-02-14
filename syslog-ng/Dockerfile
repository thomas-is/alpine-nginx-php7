ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add ca-certificates syslog-ng

RUN rm -rf /var/cache/apk/*

COPY ./syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "syslog-ng", "-F", "--no-caps" ]
