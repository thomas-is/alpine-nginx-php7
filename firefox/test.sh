#!/bin/sh

docker build -t test .

docker run --rm -it \
    --name firefox \
    --shm-size=2048m \
    -u $(id -u):$(id -g) \
    -e HOME=/home/firefox \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/firefox/.Xauthority:ro \
    -e PULSE_SERVER=unix:/pulse \
    -v /run/user/$(id -u)/pulse/native:/pulse \
    test
#    -v $(pwd)/mozilla:/home/firefox/.mozilla \
