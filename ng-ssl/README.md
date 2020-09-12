# ng-ssl

## Quick start

```
docker run -d --rm -p 80:80 -p 443:443 \
  --network host \
  -e SSL_DOMAIN=mydomain.net \
  -v /etc/letsencrypt:/etc/letsencrypt \
  0lfi/ng-ssl
```

## Environment variables:

### `SSL_DOMAIN`
The fully qualified domain name (FQDN) for which you have a valid certificate
in `/etc/letsencrypt`.


