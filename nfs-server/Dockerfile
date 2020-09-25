FROM alpine

ENV NFS_OPTIONS rw,no_root_squash
ENV NFS_PSK /run/secrets/nfs

RUN apk update && apk upgrade \
&&  apk add nfs-utils stunnel

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

EXPOSE 2049
VOLUME [ "/nfs" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "stunnel" ]
