ARG ALPINE=latest

FROM alpine:$ALPINE

ENV SFTP_USER sftp
ENV SFTP_PASS ""
ENV SFTP_PASSFILE /run/docker/secrets/sftp-pass
ENV SFTP_PUBKEY /run/docker/secrets/sftp-id_rsa.pub

RUN apk update && apk upgrade
RUN apk add \
  ca-certificates \
  openssh-server \
  openssh-sftp-server

RUN rm -rf /var/cache/apk/*

COPY ./sshd_config /etc/ssh/sshd_config

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

RUN mkdir -p /srv
COPY ./README.md /srv/README.md

EXPOSE 22
VOLUME /srv

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD ["/usr/sbin/sshd", "-D", "-e"]
