# ng

Nginx with auto-update config.


## entrypoint

`docker-entrypoint.sh` starts `ng-conf-monitor.sh` in the background.

On changes in `/etc/nginx/conf.d`, configuration is tested. If it's valid, nginx
is reloaded.


## environment variables:

- `NG_USER`
  - user nginx runs as (default "nginx")


## volumes

- `/etc/nginx/conf.d`
  - **should** be mounted as an external volume
- `/etc/letsencrypt`
  - **may** be mounted as an external volume

