#!/bin/sh

while true
do

  STAMPS=$( stat -c '%Z' /etc/nginx/conf.d/* )
  while [ "$STAMPS" = "$( stat -c '%Z' /etc/nginx/conf.d/* )" ]
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
