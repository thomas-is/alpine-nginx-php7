FROM alpine

RUN apk update && apk upgrade
RUN apk add ca-certificates figlet \
  curl bind-tools \
  git \
  openssh-client \
  mysql-client \
  psqlodbc postgresql-client \
  bzip2 gzip zip

COPY profile /root/.profile

CMD [ "/bin/sh", "-l" ]
