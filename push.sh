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

if [ "$1" != "" ] ; then
  IMAGELIST="$@"
else
  IMAGELIST=$( ls -d */ )
fi
# remove unwanted "/"
IMAGELIST=$( echo "$IMAGELIST" | sed -e 's/\///g' )

echo
for IMAGE in $IMAGELIST
do

  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  if [ -f $IMAGE/ignore ] ; then echo "[$ORG$REPO/$IMAGE$RST] ignored"; continue ; fi

  echo "[$GRN$REPO/$IMAGE$RST] push"

  CMD="docker push 0lfi/$IMAGE:$TAG"
  echo "  $CMD"
  $CMD > /dev/null || exit 1
  CMD="docker push 0lfi/$IMAGE:latest"
  echo "  $CMD"
  $CMD > /dev/null || exit 1

done
echo
