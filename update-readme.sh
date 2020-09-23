#!/bin/sh

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

printf "${GRN}Docker Hub password:$RST "
stty -echo
read PASS
stty echo
printf "\n"

printf "${ORG}Requesting JWT from Docker Hub$RST ... "
JWT=$(
curl -s -H "Content-Type: application/json" \
  -d "{\"username\":\"0lfi\",\"password\":\"${PASS}\"}" \
  https://hub.docker.com/v2/users/login/ \
  | jq -r .token )

if [ "$JWT" = "null" ] ; then
  printf "${RED}fail$RST\n"
  exit 1
fi
printf "${GRN}success$RST\n"


for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ -f $IMAGE/ignore ] ; then echo "${ORG}Skipping $IMAGE"; continue ; fi
  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  if [ ! -f $IMAGE/README.md ] ; then continue ; fi

  printf "${ORG}Updating README for $IMAGE$RST ... "
  REPO_URL="https://hub.docker.com/v2/repositories/0lfi/$IMAGE/"
  PAYLOAD=$( jq -nc --arg desc "$( cat ./$IMAGE/README.md )" '{"full_description": $desc}' )
  STATUS=$( curl \
    -s --output /dev/null \
    --write-out %{response_code} \
    -X PATCH \
    -H "Authorization: JWT ${JWT}" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD" \
    $REPO_URL )

  if [ "$STATUS" != "200" ] ; then
    printf "${RED}fail$RST\n"
    exit 1
  fi
  printf "${GRN}success$RST\n"
done
