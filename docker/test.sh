#!/bin/sh

docker build -t test .

docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock test
