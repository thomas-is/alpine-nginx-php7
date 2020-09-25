#!/bin/sh

docker volume rm test
docker volume create \
  --driver local \
  --opt type=nfs4 \
  --opt o=addr=127.0.0.1,rw \
  --opt device=:/nfs/graylog \
  test

docker run --rm -it \
  -p 127.0.0.1:2049:2049 \
  -v /home/debian/tmp/psk:/psk \
  -e NFS_SERVER=cluster.tech-incube.fr \
  -e NFS_PSK=/psk \
  0lfi/nfs-client:amd64 sh -l
