ARG ALPINE_VERSION=latest

FROM alpine:$ALPINE_VERSION

ENV NG_USER nginx
RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./ng-conf-monitor.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
