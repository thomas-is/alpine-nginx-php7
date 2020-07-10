# ng-pgadmin

## Quick start
```
docker build -t ng-pgadmin .
docker run -d --rm -p 8080:80 ng-pgadmin
```
<http://localhost:8080>

## configuration

The `PGA_SERVERS` envionment variable is a json encoded list of servers.

Default value is:
```
'{"0":{"desc":"Local Host","host":"localhost","port":"5432"}}'
```

You can specify your own:
```
PGA_SERVERS='{"0":{"desc":"MyDB","host":"db.mydomain.org","port":"7777"}}'
docker run -d --rm -p e PGA_SERVERS=$PGA_SERVERS 8080:80 ng-pgadmin
```
