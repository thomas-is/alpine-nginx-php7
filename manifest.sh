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
  if [ -f $IMAGE/ignore ] ; then echo "[$ORG$REPO/$IMAGE$RST] ignored"; continue ; fi

  echo "[$GRN$REPO/$IMAGE$RST] manifest"

  CMD="docker manifest create $REPO/$IMAGE:latest --amend $REPO/$IMAGE:amd64 --amend $REPO/$IMAGE:arm"
  echo "  $CMD"
  $CMD > /dev/null || exit 1

  CMD="docker manifest push $REPO/$IMAGE:latest"
  echo "  $CMD"
  $CMD > /dev/null || exit 1

done
echo
