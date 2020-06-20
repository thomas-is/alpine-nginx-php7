FROM alpine

# essential
RUN apk update &&  \
    apk upgrade && \
    apk add nginx php7 php7-fpm

RUN mkdir /run/nginx

# add some php7 libs
RUN apk add \ 
      php7-curl \
      php7-iconv \
      php7-json \
      php7-mbstring \
      php7-openssl \
      php7-pdo php7-pdo_mysql php7-pdo_pgsql \
      php7-session

COPY ./etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./srv /srv

CMD php-fpm7 && /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;" 
