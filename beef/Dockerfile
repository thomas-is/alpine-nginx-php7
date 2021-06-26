ARG ALPINE=latest

FROM alpine:$ALPINE

ENV USER_ID 1000
ENV NG_USER nginx

RUN apk update && apk upgrade \
&&  apk add ca-certificates \
  bash shadow sudo g++ make ruby ruby-dev \
  ruby-etc ruby-bigdecimal ruby-rdoc \
  ruby-concurrent-ruby imagemagick \
  nginx git
#  nginx-mod-stream

RUN rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./http.d /etc/nginx/http.d
COPY ./srv /srv

#RUN gem install etc
#RUN gem install bigdecimal

RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
RUN adduser beef -h /home/beef --disabled-password
RUN usermod beef -aG wheel
RUN mkdir -p /home/beef/src
WORKDIR /home/beef
RUN git clone https://github.com/beefproject/beef.git ./src
RUN chown -R beef:beef /home/beef
#COPY ./src /home/beef/src
WORKDIR /home/beef/src
RUN sed -i 's/passwd: beef/passwd: admin/g' config.yaml
RUN bash -c 'echo -e "Y/n" | ./install'

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./ng-conf-monitor.sh /usr/local/bin/
RUN chmod -R 744 /usr/local/bin

EXPOSE 3000 

ENTRYPOINT [ "docker-entrypoint.sh" ]
#CMD [ "/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;" ]
CMD [ "/home/beef/src/beef" ]
