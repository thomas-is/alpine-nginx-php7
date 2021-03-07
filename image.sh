#!/bin/sh

REPO="0lfi"

RST="\033[0m"
RED="\033[1;31m"
GRN="\033[1;32m"
ORG="\033[1;33m"
BLU="\033[1;34m"

case $( uname -m ) in
  x86_64)
    TAG="amd64"
    ALPINE="latest"
    ;;
  armv7l)
    TAG="arm32v7"
#   workaround alpine issue on arm
#   <https://gitlab.alpinelinux.org/alpine/aports/-/issues/12091>
#    ALPINE="3.12"
    ALPINE="latest"
    ;;
  *)
    TAG="noarch"
  ;;
esac

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

  echo "[$GRN$REPO/$IMAGE$RST]"

  CMD="docker build -t $REPO/$IMAGE:$TAG --build-arg ALPINE=$ALPINE ./$IMAGE"
  echo "  $CMD"
  $CMD > /dev/null || exit 1

  CMD="docker push 0lfi/$IMAGE:$TAG"
  echo "  $CMD"
  $CMD > /dev/null || exit 1

done
echo
