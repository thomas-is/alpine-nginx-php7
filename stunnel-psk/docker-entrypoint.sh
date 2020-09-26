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
ciphers = PSK
PSKsecrets = ${PSK_FILE}
EOF

exec "$@"
