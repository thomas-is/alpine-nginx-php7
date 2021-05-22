#!/bin/sh

docker build -t dosbox .

docker run --rm -it \
    --name dosbox \
    -e HOME=/home/dosbox \
    -e USER_ID=$(id -u) \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME/.Xauthority:/home/dosbox/.Xauthority \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e PULSE_SERVER=unix:/pulse \
    -v /run/user/$(id -u)/pulse/native:/pulse \
    -v ~/games/dos:/home/dosbox/drive \
    dosbox "$@"
