# docker images

<https://hub.docker.com/u/0lfi>

All images are based on Alpine.

Due to an issue on Alpine ARM, builds for `arm32v7` use `alpine:3.12`
<https://gitlab.alpinelinux.org/alpine/aports/-/issues/12091>.

Builds for `amd64` use `alpine:latest` instead.


## shell scripts

- `image.sh`: build and push `image:arch`
- `manifest.sh`: create and push manifest for `image:latest`
- `update-readme.sh`: update README on dockerhub
