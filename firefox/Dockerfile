ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add tar bzip2 firefox-esr ffmpeg xorg-server-dev ttf-tlwg pulseaudio gnome-icon-theme

RUN rm -rf /var/cache/apk/*

RUN adduser firefox -h /home/firefox --disabled-password
RUN mkdir -p /home/firefox/downloads
COPY ./profile.tbz2 /home/firefox/
RUN cd /home/firefox && tar xvjf ./profile.tbz2
RUN rm /home/firefox/profile.tbz2
RUN chown -R firefox:firefox /home/firefox

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "/usr/bin/firefox" ]
