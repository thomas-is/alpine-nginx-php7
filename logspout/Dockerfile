ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add ca-certificates git

RUN git clone https://github.com/gliderlabs/logspout.git /src
RUN /src/build.sh

RUN rm -rf /src
RUN rm -rf /var/cache/apk/*

CMD [ "logspout" ]
