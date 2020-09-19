#!/bin/sh

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

if [ "$( uname -m )" = "x86_64" ] ; then
  TAG="amd64"
else
  TAG="arm"
fi

for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi

  echo "${BLU}docker build -t 0lfi/$IMAGE:$TAG ./$IMAGE $RST"
  docker build -t 0lfi/$IMAGE:$TAG ./$IMAGE || exit 1
  echo "${BLU}docker tag 0lfi/$IMAGE:$TAG 0lfi/$IMAGE:latest$RST"
  docker tag 0lfi/$IMAGE:$TAG 0lfi/$IMAGE:latest || exit 1

done
