FROM alpine

RUN apk update && apk upgrade \
&&  apk add ca-certificates nginx

RUN rm /var/cache/apk/*
RUN mkdir -p /run/nginx

COPY ng-default.conf /etc/nginx/conf.d/default.conf
COPY srv /srv

EXPOSE 80
VOLUME /srv

CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
