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

ADD https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc /etc/vim/vimrc

CMD [ "/bin/sh", "-l" ]
