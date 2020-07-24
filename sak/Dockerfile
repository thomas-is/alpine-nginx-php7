FROM alpine

RUN apk update && apk upgrade
RUN apk add ca-certificates figlet \
  busybox-extras \
  curl bind-tools netcat-openbsd \
  openssh-client \
  mysql-client \
  psqlodbc postgresql-client \
  git \
  bzip2 gzip zip

COPY profile /root/.profile

CMD [ "/bin/sh", "-l" ]
