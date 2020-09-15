# lazyproxy

Lazyproxy Will blindly `proxy_pass`:
`https://$SSL_DOMAIN/container/URI` to `http://container:80/URI`

Containers must be on the same docker network as lazyproxy to be reachable.

Error codes:
- 502 (bad gateway) on unreachable containers
- 403 (forbidden) on the root (/) URI


## Quick start

```
docker run -d --rm -p 80:80 -p 443:443 \
  --network some_network_with_others_containers \
  -e SSL_DOMAIN=mydomain.net \
  -v /etc/letsencrypt:/etc/letsencrypt \
  0lfi/lazyproxy
```


## Environment variables:

### `SSL_DOMAIN`
The fully qualified domain name (FQDN) for which you have a valid certificate
in `/etc/letsencrypt`.

