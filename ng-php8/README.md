# ng-php8

## TL;TR

```
docker run -d --rm -p 8080:80 0lfi/ng-php8
```
<http://localhost:8080> will display `phpinfo()`

```
docker run -it --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/srv \
  -e FPM="disabled" \
  0lfi/ng-php8 \
  php -a
```
interactive PHP shell


## Environment variables

- `FPM`
  - default `enabled`
  - set to any other value to disable `php-fpm`
- `FPM_USER`
  - default `nobody`
  - can be set as `root` (**use at your own risk**)
  - ignored if `php-fpm` is disabled
- `FPM_CLEAR_ENV`
  - default `yes`
  - set explicitly to `no` to access environment variables from `php-fpm`
  - ignored if `php-fpm` is disabled

