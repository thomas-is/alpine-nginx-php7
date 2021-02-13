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

COPY profile /root/.profile

RUN git clone https://github.com/thomas-is/rc /root/rc && \
  mv /root/rc/vimrc /root/.vimrc && \
  rm -rf /root/rc

CMD [ "/bin/sh", "-l" ]
