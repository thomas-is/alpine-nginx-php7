ARG ALPINE=latest

FROM alpine:$ALPINE

ENV NG_USER nginx
RUN apk update && apk upgrade \
&&  apk add ca-certificates \
  nginx \
  nginx-mod-stream

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./stream.d /etc/nginx/stream.d
COPY ./http.d /etc/nginx/http.d
COPY ./srv /srv

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./ng-conf-monitor.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
