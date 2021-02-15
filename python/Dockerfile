ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade \
&&  apk add ca-certificates curl \
    vim python3 py3-pip

RUN rm -rf /var/cache/apk/*

COPY profile /etc/profile

RUN curl -s https://raw.githubusercontent.com/thomas-is/rc/main/vimrc > /etc/vim/vimrc

RUN ln -s /usr/bin/python3 /usr/bin/python

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod -R 755 /usr/local/bin

RUN mkdir /src

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "sh", "-l" ]
