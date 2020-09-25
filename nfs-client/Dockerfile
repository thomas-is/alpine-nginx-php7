FROM alpine

ENV NFS_SERVER 127.0.0.1

RUN apk update && apk upgrade \
&&  apk add stunnel

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

EXPOSE 2049

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "stunnel" ]
