# 0lfi/pgadmin

## Quick start
```sh
docker run --rm -d \
-e PGA_SERVERS="localhost,db.mydomain.org:5555,db.myotherdomain.net:9999" \
-p 8080:80 pgadmin
```

## Environment variables 

- `PGA_SERVERS`
Coma separated list of `hostname:port`.
If ommited, port is set to 5432.
