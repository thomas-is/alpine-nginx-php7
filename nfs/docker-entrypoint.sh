#!/bin/sh

sed -i -e "s/\${NFS_NETWORK}/$NFS_NETWORK/g" /etc/exports
sed -i -e "s/\${NFS_OPTIONS}/$NFS_OPTIONS/g" /etc/exports

exportfs -arv

exec "$@"
