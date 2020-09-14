#!/bin/sh

if [ "$( uname -m )" = "x86_64" ] ; then
  TAG="latest"
else
  TAG="arm"
fi

echo "docker login"
docker login -u 0lfi

for IMAGE in $( ls -d */ | sed -e 's/\///g' )
do
  if [ ! -f $IMAGE/Dockerfile ] ; then continue ; fi
  echo "docker build -t 0lfi/$IMAGE:$TAG ./$IMAGE"
  docker build -t 0lfi/$IMAGE:$TAG ./$IMAGE
  echo "docker push 0lfi/$IMAGE:$TAG"
  docker push 0lfi/$IMAGE:$TAG
done
