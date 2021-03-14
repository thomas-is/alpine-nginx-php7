# ng-php7

## TL;TR


Display `phpinfo()` on <http://localhost:8080>:
```sh
docker run -d --rm -p 8080:80 0lfi/ng-php7
```

Serve `/some/contents` on <http://localhost:8080>:
```sh
docker run -d --rm \
  -v /some/contents:/srv \
  -p 8080:80 \
  0lfi/ng-php7
```

Pop an interactive PHP shell as current user on host working dir:
```sh
docker run -it --rm \
  -u $(id -u):$(id -g) \
  -v $(pwd):/srv \
  0lfi/ng-php7 \
  php -a
```


## Environment variables

- `FPM_USER`
  - user `php-fpm` will run as
  - default is `nobody`
  - can be set as `root` (**use at your own risk**)

- `FPM_CLEAR_ENV`
  - default `yes`
  - set explicitly to `no` to access environment variables from `php-fpm`


## Running container as non-root user

When running container as non-root user:
- `php-fpm` is **not** started
- `FPM_USER` and `FPM_CLEAR_ENV` are **ignored**

Primary purpose is to run PHP scripts interactively as current user.

Add this to your `.bash_aliases`:
```sh
alias php7='docker run --rm -it --user $(id -u):$(id -g) -v $(pwd):/srv 0lfi/ng-php7 php'
```
