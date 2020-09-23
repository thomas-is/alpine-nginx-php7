#!/bin/sh

adduser -D sshfs
cat /run/secrets/sshfs_rsa > /etc/ssh/ssh_host_rsa_key
