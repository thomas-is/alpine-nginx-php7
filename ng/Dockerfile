ARG ALPINE=latest

FROM alpine:$ALPINE

ENV NG_USER nginx
RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./conf.d /etc/nginx/conf.d
COPY ./srv /srv

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./ng-conf-monitor.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
