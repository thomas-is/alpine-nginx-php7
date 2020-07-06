# ng-ssl

Environement variables:
    SSL_DOMAIN

## Quick start

```
docker build -t ng-ssl .
docker run -d --rm -p 80:80 -p 443:443 \
  --network host \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -e SSL_DOMAIN=mydomain.net \
  ng-ssl
```

