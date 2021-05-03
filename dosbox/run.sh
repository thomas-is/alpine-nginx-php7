#!/bin/sh

docker run --rm -it \
    --name dosbox \
    -u $(id -u):$(id -g) \
    -e HOME=/dosbox \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/dosbox/.Xauthority \
    -e PULSE_SERVER=unix:/pulse \
    -v /run/user/$(id -u)/pulse/native:/pulse \
    -v ~/games/dos:/dosbox/drive \
    0lfi/dosbox
