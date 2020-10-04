#!/bin/sh
#  -v /usr/share/fonts:/usr/share/fonts:ro \
docker run --rm -it \
  -e DISPLAY=${DISPLAY} \
  -e FIREFOX_UID=$(id -u) \
  -e FIREFOX_GID=$(id -g) \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --device /dev/snd \
  --device /dev/dri \
  0lfi/firefox
