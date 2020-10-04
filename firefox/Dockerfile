FROM alpine

ENV DISPLAY :0.0
ENV FIREFOX_UID 1000
ENV FIREFOX_GID 1000

RUN apk update && apk upgrade \
&&  apk add ca-certificates ttf-droid firefox

RUN adduser firefox -u $FIREFOX_UID -g $FIREFOX_GID --disabled-password

VOLUME [ "/tmp/.X11-unix" ]

CMD [ "su","firefox","-c","/usr/bin/firefox" ]
