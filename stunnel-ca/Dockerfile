ARG ALPINE=latest

FROM alpine:$ALPINE

ENV CLIENT      no
ENV SSL_DOMAIN  ""
ENV ACCEPT      0.0.0.0:443
ENV CONNECT     127.0.0.1:80
ENV VERIFY      ""

RUN apk update && apk upgrade && \
  apk add ca-certificates stunnel openssl

RUN rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

VOLUME [ "/etc/letsencrypt" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "stunnel" ]
