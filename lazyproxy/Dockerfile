FROM alpine

ENV SSL_DOMAIN localhost

RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx certbot-nginx

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

VOLUME [ "/etc/letsencrypt" ]
EXPOSE 80 443

COPY ./crontab /etc/crontabs/root
COPY ./proxy.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
