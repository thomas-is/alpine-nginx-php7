# stunnel-psk

<https://www.stunnel.org>

SSL tunnel using pre shared keys (PSK).

## Environment variables

### `CLIENT`
Set to `yes` to run stunnel as a client (default is server).

### `ACCEPT`
Accept connections on specified `address:port` (default is `0.0.0.0:8080`).

### `CONNECT`
Connect to remote `address:port` (default is `127.0.0.1:80`).

### `PSK_FILE`
Path to the PSK(s) file (default is `/run/secrets/psk`.
It may contains multiple keys.

## PSK generation
```
echo "foobar:$( echo $(openssl rand 64 | base64 ))" >> ./psk
```
The `echo` in the double sub shell is needed to avoid unwanted line-breaks.
