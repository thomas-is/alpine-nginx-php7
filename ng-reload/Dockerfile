FROM alpine

RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx inotify-tools

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./ng-conf-monitor.sh   /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

VOLUME [ "/etc/nginx/conf.d", "/etc/letsencrypt" ]
EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
