ARG ALPINE=latest

FROM alpine:$ALPINE

RUN apk update && apk upgrade
RUN apk add ca-certificates docker figlet \
  curl jq \
  openssh-client \
  git \
  bzip2 gzip zip \
  vim

RUN rm -rf /var/cache/apk/*

COPY profile /etc/profile

RUN curl -s https://raw.githubusercontent.com/thomas-is/rc/main/.vimrc > /etc/vim/vimrc

CMD [ "/bin/sh", "-l" ]
