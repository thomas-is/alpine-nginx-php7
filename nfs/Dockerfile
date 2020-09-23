FROM alpine

ENV NFS_NETWORK 10.0.0.0
ENV NFS_OPTIONS rw,no_root_squash

RUN apk update && apk upgrade \
&&  apk add nfs-utils 

COPY exports /etc/exports

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 744 /usr/local/bin/docker-entrypoint.sh

VOLUME [ "/nfs" ]

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "crond", "-f", "-l", "8" ]
