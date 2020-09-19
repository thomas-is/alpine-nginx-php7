FROM alpine

ENV VHOSTS localhost
ENV DOMAIN localhost.local

RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx certbot-nginx

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

COPY ./ng-base.conf  /etc/nginx/conf.d/default.conf
COPY ./ng-entry.conf /tmp/ng-entry.conf

VOLUME [ "/etc/letsencrypt" ]
EXPOSE 80 443

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
