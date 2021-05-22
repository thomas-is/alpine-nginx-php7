ARG ALPINE=latest

FROM alpine:$ALPINE

ENV USER_ID 1000

RUN apk update && apk upgrade \
&&  apk add dosbox xorg-server-dev pulseaudio shadow

RUN rm -rf /var/cache/apk/*

RUN adduser dosbox -h /home/dosbox --disabled-password
RUN mkdir -p /home/dosbox/drive
RUN chown -R dosbox:dosbox /home/dosbox

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/bin/dosbox", "-c", "'KEYB FR'","-c", "'MOUNT C /home/dosbox/drive'", "-c", "'C:'" ]
