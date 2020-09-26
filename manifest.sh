#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

# create manifest for all images
# images with tags amd64 and arm must exists
for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  if [ -f $IMAGE/ignore ] ; then echo "${ORG}Skipping $IMAGE"; continue ; fi

  CMD="docker manifest create $REPO/$IMAGE:latest \
  --amend $REPO/$IMAGE:amd64 \
  --amend $REPO/$IMAGE:arm"
  echo "$BLU$CMD$RSt"
  $CMD || echo "${RED}Failed!$RST"

  CMD="docker manifest push $REPO/$IMAGE:latest"
  echo "$BLU$CMD$RSt"
  $CMD || echo "${RED}Failed!$RST"

done
