# ng-php7

## TL;TR

```
docker run -d --rm -p 8080:80 0lfi/ng-php7
```
<http://localhost:8080> will display `phpinfo()`

## Environment variables

- `PHP_USER`
  - default `nobody`
  - can be set as `root` (**use at your own risk**)
- `PHP_CLEAR_ENV`
  - default `yes`
  - set explicitly to `no` to access environment variables from PHP
