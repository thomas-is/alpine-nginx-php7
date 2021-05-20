# 0lfi/pgadmin

## TL;TR

```bash
docker run --rm -d \
  -p 8080:80 \
  -e PGA_SERVERS="localhost,db.mydomain.org:5555,db.myotherdomain.net:9999" \
  0lfi/pgadmin
```

## Environment variables

- `PGA_SERVERS`
  - coma separated list of `hostname:port`
  - if port is ommited, default port 5432 is used
