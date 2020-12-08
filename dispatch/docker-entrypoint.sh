#!/bin/sh

DISPATCH_CONF="/etc/dispatch/dispatch.json"
NG_CONF="/etc/nginx/conf.d/default.conf"

keys () {
  local INDEX=0
  while [ "$(echo $JSON | jq -r keys[$INDEX])" != "null" ]
  do
    echo $JSON | jq -r keys[$INDEX]
    INDEX=$((INDEX+1))
  done
}

DISPATCH=$( jq . $DISPATCH_CONF )

JSON=$( echo "$DISPATCH" | jq .rules )
RULES=$JSON
if [ "$RULES" = "null" ] ; then
  echo "NOTICE: no global rules"
else
  for INDEX in $(keys); do
    echo "$RULES" | jq -r .[$INDEX] >> $NG_CONF
  done
fi

JSON=$( echo "$DISPATCH" | jq .servers )
SERVERS=$JSON
if [ "$JSON" = "null" ] ; then
  echo "FATAL: servers is null"
  exit 1
fi

for INDEX in $(keys)
do

  SERVER_NAME=$( echo "$SERVERS" | jq -r .[$INDEX].server_name )
  LISTEN=$(      echo "$SERVERS" | jq -r .[$INDEX].listen )
  SERVER_RULES=$(echo "$SERVERS" | jq -r .[$INDEX].rules )
  LOCATION=$(    echo "$SERVERS" | jq -r .[$INDEX].location )

  if [ "$SERVER_NAME" = "null" ] ; then
    echo "servers[$INDEX].server_name is null, assuming default_server"
    SERVER_NAME="defaul_server"
  fi

  if [ "$LISTEN" = "null" ] ; then
    echo "servers[$INDEX].listen, assuming 80"
    LISTEN="80"
  fi

  echo "server {"                    >> $NG_CONF
  echo "  server_name $SERVER_NAME;" >> $NG_CONF
  echo "  listen $LISTEN;"           >> $NG_CONF

  if [ ! -z "$( echo $LISTEN | grep -i ssl )" ] ; then
    echo "  ssl_certificate     /etc/letsencrypt/live/\$host/fullchain.pem;" >> $NG_CONF
    echo "  ssl_certificate_key /etc/letsencrypt/live/\$host/privkey.pem;"   >> $NG_CONF
  fi

  if [ "$SERVER_RULES" != "null" ] ; then
    JSON="$SERVER_RULES"
    for RULE_INDEX in $(keys)
    do
      RULE=$( echo "$SERVER_RULES" | jq -r .[$RULE_INDEX] )
      echo "  $RULE" >> $NG_CONF
    done
  fi

  if [ "$LOCATION" != "null" ] ; then
    JSON=$LOCATION
    for URI in $(keys)
    do

      ENDPOINT=$( echo "$LOCATION" | jq -r .'"'$URI'"'.endpoint )
      RULES=$(    echo "$LOCATION" | jq -r .'"'$URI'"'.rules )

      echo "  location $URI {" >> $NG_CONF

      if [ "$RULES" != "null" ]; then
        JSON="$RULES"
        for RULE_INDEX in $(keys)
        do
          RULE=$( echo "$RULES" | jq -r .[$RULE_INDEX] )
          echo "    $RULE" >> $NG_CONF
        done
      fi

      if [ "$ENDPOINT" != "null" ]; then
        echo "    set \$endpoint http://$ENDPOINT;" >> $NG_CONF
        echo "    proxy_pass \$endpoint;" >> $NG_CONF
      fi

      echo "  }" >> $NG_CONF

    done
  fi
  echo "}" >> $NG_CONF
done

exec "$@"
