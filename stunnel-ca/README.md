# stunnel-ca

<https://www.stunnel.org>

SSL tunnel between two FQDN using letsencrypt certificates.


## Environment variables

- `CLIENT`
  - set to `yes` to run stunnel as a client (default is server).

- `SSL_DOMAIN`
  - fully qualified domain name (FQDN)
  - with cert in `/etc/letsencrypt/live/$SSL_DOMAIN`

- `ACCEPT`
  - accept connections on specified `address:port` (default is `0.0.0.0:443`)

- `CONNECT`
  - connect to remote `address:port` (default is `127.0.0.1:80`)

- `VERIFY`
  - optional, a coma separated list of hosts.
  - enable `verifyChain` for each host.
