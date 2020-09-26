#!/bin/sh

cat > /etc/stunnel/stunnel.conf <<EOF
foreground = yes
setuid = root
setgid = root
pid = /run/stunnel.pid
output = /dev/stdout
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
client = ${CLIENT:-no}

[tunnel]
accept  = ${ACCEPT}
connect = ${CONNECT}
cert = /etc/letsencrypt/live/${SSL_DOMAIN}/fullchain.pem
key =  /etc/letsencrypt/live/${SSL_DOMAIN}/privkey.pem
CApath = /etc/ssl/certs
EOF

if [ "$VERIFY" ] ; then
  echo "verifyChain = yes" >> /etc/stunnel/stunnel.conf
  IFS=','
  for HOST in $VERIFY
  do
    echo "checkHost = $HOST" >> /etc/stunnel/stunnel.conf
  done
else
  echo "verifyChain = no" >> /etc/stunnel/stunnel.conf
fi

exec "$@"
