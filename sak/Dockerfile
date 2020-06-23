FROM alpine

RUN apk update && apk upgrade
RUN apk add ca-certificates figlet \
  git \
  openssh-client \
  mysql-client \
  psqlodbc postgresql-client \
  bzip2 gzip zip \
  curl

COPY profile /root/.profile

CMD tail -f /dev/null 
