# 0lfi/myadmin

## Quick start
```sh
docker run --rm -d \
-e PMA_SERVERS="localhost,db.mydomain.org:5555,db.myotherdomain.net:9999" \
-p 8080:80 myadmin
```

## Environment variables 

- `PMA_SERVERS`
Coma separated list of `hostname:port`.
