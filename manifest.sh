#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

if [ "$1" != "" ] ; then
  IMAGELIST="$@"
else
  IMAGELIST=$( ls -d */ )
fi
# remove unwanted "/"
IMAGELIST=$( echo "$IMAGELIST" | sed -e 's/\///g' )

echo
# create manifest for each image
# `latest`, `amd64` and `arm` images must exists on registry already
for IMAGE in $IMAGELIST
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
