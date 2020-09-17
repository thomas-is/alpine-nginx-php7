FROM alpine

RUN apk update && apk upgrade
RUN apk add ca-certificates figlet \
  busybox-extras \
  curl bind-tools netcat-openbsd \
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

COPY profile /root/.profile

RUN git clone https://github.com/thomas-is/vim /root/vim && \
  mv /root/vim/.vimrc /root/ && \
  rm -rf /root/vim

CMD [ "/bin/sh", "-l" ]
