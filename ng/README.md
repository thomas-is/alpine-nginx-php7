# ng

Nginx with auto-reload config capabilities.

## TL;DR
```
docker run --rm -d -p 8080:80 0lfi/ng
```
<http://localhost:8080>

## environment variables:

- `NG_USER`
  - user nginx runs as (default "nginx")

## entrypoint

`docker-entrypoint.sh` starts `ng-conf-monitor.sh` in the background.

On changes in `/etc/nginx/conf.d`, configuration is tested. If it's valid, nginx
is reloaded.
