# stunnel

<https://www.stunnel.org/static/stunnel.html>

## Environment variables

### `SSL_DOMAIN`
Fully qualified domain name (FQDN) with cert in `/etc/letsencrypt/live/[FQDN]`

### `CLIENT`
Run stunnel as a client (default is server)

### `ACCEPT`
Accept connections on specified address:port

### `CONNECT`
Connect to remote address:port

### `VERIFY`
A coma separated list of allowed hosts.
Each host authenticate with its FQDN certificate.
