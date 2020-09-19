# stunnel

<https://www.stunnel.org/static/stunnel.html>

## Environment variables

### `CLIENT`
Set to `yes` to run stunnel as a client (default is server).

### `SSL_DOMAIN`
Fully qualified domain name (FQDN) with cert in `/etc/letsencrypt/live/[FQDN]`.

### `ACCEPT`
Accept connections on specified `address:port` (default is `0.0.0.0:443`).

### `CONNECT`
Connect to remote `address:port` (default is `127.0.0.1:80`).

### `VERIFY`
Optional, a coma separated list of hosts.
Enable `verifyChain` for each host.
