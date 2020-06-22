# ng-php7



## Quick start

```
docker built -t ng-php7
docker run -d --rm -p 8080:80 ng-php7
```
<http://localhost:8080> will display `phpinfo()`


## Configuration

Use volumes on `/etc/nginx.conf.d` and `/srv`.
```
docker run -d --rm -p 8080:80 \
  -v ($pwd)/etc/nginx/conf.d:/etc/nginx/conf.d \
  -v ($pwd)/srv:/srv \
  ng-php7
```
