ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add firefox-esr ffmpeg xorg-server-dev ttf-tlwg pulseaudio gnome-icon-theme

RUN rm -rf /var/cache/apk/*

RUN adduser firefox -h /home/firefox --disabled-password
RUN mkdir -p /home/firefox/downloads
COPY ./mozilla /home/firefox/.mozilla
RUN chown -R firefox:firefox /home/firefox

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/firefox" ]
