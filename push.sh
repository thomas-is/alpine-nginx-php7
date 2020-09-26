#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

# non and64 is considered arm
if [ "$( uname -m )" = "x86_64" ] ; then
  TAG="amd64"
else
  TAG="arm"
fi

# push all images
for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  if [ -f $IMAGE/ignore ] ; then echo "${ORG}Skipping $IMAGE"; continue ; fi

  CMD="docker push 0lfi/$IMAGE:$TAG"
  echo "$BLU$CMD$RST"
  $CMD || exit 1
  CMD="docker push 0lfi/$IMAGE:latest $RST"
  echo "$BLU$CMD$RST"
  $CMD || exit 1

done
