#!/bin/sh

while true
do

  STAMPS=$( stat -c '%Z' /etc/nginx/* )
  while [ "$STAMPS" = "$( stat -c '%Z' /etc/nginx/* )" ]
  do
    sleep 1
  done

  echo "nginx -t"
  nginx -t
  if [ $? -eq 0 ] ;  then
    echo "nginx -s reload"
    nginx -s reload
  fi

done
