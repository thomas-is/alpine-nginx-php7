ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add python3 py3-pip

RUN rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/python3 /usr/bin/python

COPY ./profile /etc/profile

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

RUN mkdir /src

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
