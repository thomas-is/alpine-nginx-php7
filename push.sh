#!/bin/sh

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

echo "${ORG}docker login -u 0lfi$RST"
docker login -u 0lfi
if [ $? != 0 ] ; then
  exit 1
fi

if [ "$( uname -m )" = "x86_64" ] ; then
  TAG="amd64"
else
  TAG="arm"
fi

for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ -f $IMAGE/ignore ] ; then echo "${ORG}Skipping $IMAGE"; continue ; fi
  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi

  echo "${BLU}docker push 0lfi/$IMAGE:$TAG $RST"
  docker push 0lfi/$IMAGE:$TAG || exit 1
  echo "${BLU}docker push 0lfi/$IMAGE:latest $RST"
  docker push 0lfi/$IMAGE:latest || exit 1

done

for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ -f $IMAGE/ignore ] ; then echo "${ORG}Skipping $IMAGE"; continue ; fi
  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi

  echo "${BLU}docker manifest create 0lfi/$IMAGE:latest $RST"
  docker manifest create 0lfi/$IMAGE:latest \
  --amend 0lfi/$IMAGE:amd64 \
  --amend 0lfi/$IMAGE:arm || exit 1

  echo "${BLU}docker manifest push 0lfi/$IMAGE:latest $RST"
  docker manifest push 0lfi/$IMAGE:latest || exit 1

done
