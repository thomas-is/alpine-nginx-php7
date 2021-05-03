ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add dosbox xorg-server-dev pulseaudio

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /dosbox/drive

#COPY ./docker-entrypoint.sh /usr/local/bin/
#RUN chmod -R 744 /usr/local/bin

#ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/bin/dosbox", "-c", "KEYB FR","-c", "MOUNT C /dosbox/drive", "-c", "C:" ]
