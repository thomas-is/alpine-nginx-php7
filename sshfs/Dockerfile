FROM alpine

ENV PASSWORD changeme

RUN apk update && apk upgrade
RUN apk add ca-certificates openssh figlet \

RUN rm -rf /var/cache/apk/*

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

EXPOSE 22

CMD [ "/usr/sbin/sshd" ]
