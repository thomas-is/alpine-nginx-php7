# lazyproxy

Will `proxy_pass`:
`https://$SSL_DOMAIN/container_name/URI` to `http://container_name/URI`

Containers must be on the same docker network as lazyproxy to be reachable.


## Quick start

```
docker run -d --rm -p 80:80 -p 443:443 \
  --network some_network \
  -e SSL_DOMAIN=mydomain.net \
  -v /etc/letsencrypt:/etc/letsencrypt \
  0lfi/lazyproxy
```


## Environment variables:

### `SSL_DOMAIN`
The fully qualified domain name (FQDN) for which you have a valid certificate
in `/etc/letsencrypt`.

