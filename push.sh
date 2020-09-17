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

echo "${BLU}docker login -u 0lfi$RST"
docker login -u 0lfi

for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi

  echo "${GRN}docker build -t 0lfi/$IMAGE:$TAG ./$IMAGE $RST"
  docker build -t 0lfi/$IMAGE:$TAG ./$IMAGE

  echo "${GRN}docker push 0lfi/$IMAGE:$TAG"
  docker push 0lfi/$IMAGE:$TAG

  echo "${GRN}docker manifest create 0lfi/$IMAGE:latest $RST"
  docker manifest create 0lfi/$IMAGE:latest \
  --amend 0lfi/$IMAGE:amd64 \
  --amend 0lfi/$IMAGE:arm

  echo "${GRN}docker manifest push 0lfi/$IMAGE:latest $RST"
  docker manifest push 0lfi/$IMAGE:latest

done
