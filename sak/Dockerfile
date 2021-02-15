ARG ALPINE=latest

FROM alpine:$ALPINE

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
  vim

RUN rm -rf /var/cache/apk/*

COPY profile /etc/profile

RUN curl -s https://raw.githubusercontent.com/thomas-is/rc/main/vimrc > /root/.vimrc

CMD [ "/bin/sh", "-l" ]
