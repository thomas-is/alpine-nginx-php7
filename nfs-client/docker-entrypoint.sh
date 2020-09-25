#!/bin/sh

if [ ! -f ${NFS_PSK} ] ; then
  echo "Can't find docker secret ${NFS_PSK}"
  echo "Can't run without it!"
  exit 1
fi

cat > /etc/stunnel/stunnel.conf <<EOF
foreground = yes
setuid = root
setgid = root
pid = /run/stunnel.pid
output = /dev/stdout
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
client = yes

[nfs]
accept  = 0.0.0.0:2049
connect = ${NFS_SERVER}:2049
ciphers = PSK
PSKsecrets = ${NFS_PSK}
EOF

exec "$@"
