# proxy-path

Nginx will `proxy_pass` all requests from `https://$SSL_DOMAIN/container/path`
to `http://container:80/path`

Cron will run a `certbot renew --nginx -n -d $SSL_DOMAIN` daily.

`/etc/letsencrypt` **must** be mounted and writable.

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
The fully qualified domain name (FQDN) with certificate in `/etc/letsencrypt`.

