#!/bin/sh

cd /etc/ssh
ssh-keygen -A
cd /

if [ "$SFTP_USER" = "root" ] ; then
  echo "[fatal] SFTP_USER cannot be root!"
  exit 1
fi

if [ -f $SFTP_PASSFILE ] ; then
  export SFTP_PASS="$( cat $SFTP_PASSFILE )"
fi

echo "[info] add user $SFTP_USER with shell"
adduser $SFTP_USER -s /bin/sh -D

if [ "$SFTP_PASS" = "" ] ; then
  echo "[info] password for $SFTP_USER is disabled"
else
  echo "[info] setting up password for $SFTP_USER"
  echo -e "$SFTP_PASS\n$SFTP_PASS" | passwd $SFTP_USER
fi

if [ -f $SFTP_PUBKEY ] ; then
  echo "[info] setting up id_rsa.pub for $SFTP_USER"
  mkdir -p /home/$SFTP_USER/.ssh
  cat $SFTP_PUBKEY > /home/$SFTP_USER/.ssh/authorized_keys
fi

chown root:root /srv
chmod 755 /srv

exec "$@"
