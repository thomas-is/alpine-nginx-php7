FROM alpine

ENV CERTBOT_MAIL webmaster@localhost
ENV CERTBOT_DOMAIN localhost

RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx certbot-nginx

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./srv /srv

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
