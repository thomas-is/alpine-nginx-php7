# docker images

<https://hub.docker.com/u/0lfi>

All images are based on Alpine.

## shell scripts

- `image.sh`: build and push `image:arch`
- `manifest.sh`: create and push manifest for `image:latest`
- `update-readme.sh`: update README on dockerhub


## network issue on ARM

No network since `alpine:3.13`
<https://gitlab.alpinelinux.org/alpine/aports/-/issues/12091>.

### workaround

Add `buster-backports` to your `/etc/apt/sources.list`
```
deb http://deb.debian.org/debian buster-backports main
```

Download and install the latest Debian keyring from
<http://http.us.debian.org/debian/pool/main/d/debian-archive-keyring/>

```bash
wget http://http.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2021.1.1_all.deb
sudo dpkg -i ./debian-archive-keyring_2021.1.1_all.deb
```

Update libseccomp2
```bash
sudo apt-get install -t buster-backports libseccomp2
```

Test with ping
```bash
docker run --rm -it alpine:latest ping 8.8.8.8
```

