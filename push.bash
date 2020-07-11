#!/bin/bash

echo "docker login"
docker login -u 0lfi

for TAG in $( ls -d */ | sed -e 's/\///g' )
do
  if [ ! -f $TAG/Dockerfile ] ; then continue ; fi
  echo "docker build -t 0lfi/$TAG ./$TAG"
  docker build -t 0lfi/$TAG ./$TAG
  echo "docker push 0lfi/$TAG"
  docker push 0lfi/$TAG
done
