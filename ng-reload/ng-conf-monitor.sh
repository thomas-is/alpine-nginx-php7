#!/bin/sh

while true
do

  STAMP=$( stat /etc/nginx/conf.d | grep Modify )
  while [ "$STAMP" = "$( stat /etc/nginx/conf.d | grep Modify )" ]
  do
    sleep 5
  done

  echo "nginx -t"
  nginx -t
  if [ $? -eq 0 ]
  then
    echo "nginx -s reload"
    nginx -s reload
  fi

done
