ARG ALPINE_VERSION=latest

FROM alpine:$ALPINE_VERSION

ENV CLIENT      no
ENV ACCEPT      0.0.0.0:8080
ENV CONNECT     127.0.0.1:80
ENV PSK_FILE    /run/secrets/psk

RUN apk update && apk upgrade && \
  apk add stunnel openssl

RUN rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "stunnel" ]
