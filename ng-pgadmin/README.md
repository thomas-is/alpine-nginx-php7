# ng-pgadmin

## Quick start
```
docker build -t ng-pgadmin
docker run -d --rm -p 8080:80 \
  -v ($pwd)/srv/phppgadmin/conf:/srv/phppgadmin/conf \
  ng-pgadmin
```
<http://localhost:8080>

