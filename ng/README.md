# ng

## Quick start

```
docker build -t ng
docker run -d --rm -p 8080:80 ng
```

## Configuration

Use volumes to override default `/etc/nginx.conf.d` and `/srv`.
```
docker run -d --rm -p 8080:80 \
  -v ($pwd)/etc/nginx/conf.d:/etc/nginx/conf.d \
  -v ($pwd)/srv:/srv \
  ng
```
