ARG ALPINE=latest

FROM alpine:$ALPINE

ENV APP_MODULE "myapp:app"
ENV APP_WORKERS 4

RUN apk update && apk upgrade \
&&  apk add ca-certificates \
  nginx \
  python3 \
  py3-pip \
  py3-gunicorn \
  py3-flask \
  py3-flask-script \
  py3-flask-login \
  py3-flask-wtf \
  py3-flask-oauthlib \
  py3-flask-assets \
  py3-flask-babel


RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ng-gunicorn.conf /etc/nginx/http.d/default.conf

COPY ./static /srv/static

COPY ./app /app
WORKDIR /app

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 80

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
