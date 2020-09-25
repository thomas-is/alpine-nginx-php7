#!/bin/sh

if [ ! -f ${NFS_PSK} ] ; then
  echo "Can't find ${NFS_PSK}"
  echo "Can't run without it!"
  exit 1
fi

cat > /etc/exports <<EOF
/nfs    127.0.0.1(${NFS_OPTIONS})
EOF

cat > /etc/stunnel/stunnel.conf <<EOF
foreground = yes
setuid = root
setgid = root
pid = /run/stunnel.pid
output = /dev/stdout
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
client = no

[nfs]
accept  = 0.0.0.0:2049
connect = 127.0.0.1:2049
ciphers = PSK
PSKsecrets = ${NFS_PSK}
EOF

exportfs -arv


exec "$@"
