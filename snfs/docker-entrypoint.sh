#!/bin/sh

cat > /etc/exports <<EOF
/nfs    locahost(${NFS_OPTIONS})
EOF

exportfs -arv

cat > /etc/stunnel/stunnel.conf <<EOF
foreground = yes
setuid = root
setgid = root
pid = /run/stunnel.pid
output = /dev/stdout
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
client = no

[tunnel]
accept  = ${SSL_DOMAIN}:2049 
connect = localhost:2049
cert = /etc/letsencrypt/live/${SSL_DOMAIN}/fullchain.pem
key =  /etc/letsencrypt/live/${SSL_DOMAIN}/privkey.pem
CApath = /etc/ssl/certs
verifyChain = yes
checkHost = ${SSL_DOMAIN}
EOF

if [ "$VERIFY" ] ; then
  IFS=','
  for HOST in $VERIFY
  do
    echo "checkHost = $HOST" >> /etc/stunnel/stunnel.conf
  done
fi

exec "$@"
