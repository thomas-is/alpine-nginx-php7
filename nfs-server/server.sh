#!/bin/sh

docker build -t test-server .

docker run --rm -d \
  --privileged \
  --network sak \
  --name nfs \
  -e NFS_PSK=/psk \
  -v /home/debian/tmp/psk:/psk \
  -v /home/debian/sak:/nfs \
  test-server

