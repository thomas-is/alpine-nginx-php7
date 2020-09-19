# master-proxy

Proxy every `https://SUBDOMAIN.DOMAIN` to `http://SUBDOMAIN_router (port 80).`


Each SUBDOMAIN.DOMAIN **must** be a valid FQDN with corresponding letsencrypt
certificate in `/etc/letsencrypt/live/SUBDOMAIN.DOMAIN` (nginx won't run
otherwise).

Each SUBDOMAIN **must** be a docker stack name (502 otherwise).

A container named `router` **should** be running on the SUBDOMAIN docker stack
(502 otherwise).

Cron will daily renew certificates with certbot renew -n -d SUBDOMAIN.DOMAIN`
for each SUBDMAIN.

## environment variables

- `$DOMAIN`: domain name
- `$VHOSTS`: a coma separated list of virtual hosts (list of sub domains)

## example
```
docker run --rm -d \
  -p 80:80 \
  -p 443:443 \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -e DOMAIN=mydomain.net
  -e VHOSTS="www,webmail" \
  techincube/master-proxy
```
