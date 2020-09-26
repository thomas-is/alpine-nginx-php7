#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

# create manifest for all images
for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  if [ -f $IMAGE/ignore ] ; then echo "${ORG}Skipping $IMAGE"; continue ; fi

  CMD="docker manifest create 0lfi/$IMAGE:latest \
  --amend 0lfi/$IMAGE:amd64 \
  --amend 0lfi/$IMAGE:arm"
  echo "$BLU$CMD$RSt"
  $CMD || exit 1

  CMD="docker manifest push 0lfi/$IMAGE:latest"
  echo "$BLU$CMD$RSt"
  $CMD || exit 1

done
