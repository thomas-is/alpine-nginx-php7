ARG ALPINE_VERSION=latest

FROM alpine:$ALPINE_VERSION

RUN apk update && apk upgrade
RUN apk add ca-certificates figlet \
  busybox-extras \
  bind-tools netcat-openbsd \
  curl jq \
  openssh-client \
  mysql-client \
  psqlodbc postgresql-client \
  git \
  bzip2 gzip zip \
  vim \
  php7 \
  php7-curl \
  php7-iconv \
  php7-json \
  php7-mbstring \
  php7-openssl \
  php7-pdo php7-pdo_mysql php7-pdo_pgsql \
  php7-pecl-ssh2 \
  php7-session
RUN rm -rf /var/cache/apk/*

COPY profile /root/.profile

RUN git clone https://github.com/thomas-is/rc /root/rc && \
  mv /root/rc/vimrc /root/.vimrc && \
  rm -rf /root/rc

CMD [ "/bin/sh", "-l" ]
