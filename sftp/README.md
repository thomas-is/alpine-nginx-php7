# sftp

## TL;TR

```bash
docker run --rm -d \
  --name sftp \
  -p 222:22 \
  -e SFTP_USER="test" \
  -e SFTP_PASS="test" \
  0lfi/sftp
```
login with password `test`
```bash
sftp -P 222 test@localhost
```

## chroot

`chroot` is set to `/srv`.

**WARNING**: chroot ownership **will** be set to `root:root 755` at container
startup.

**DO NOT** bind mount your home directory to `/srv` unless you really know what
you're doing!

## env

`SFTP_USER`: username to access the server
Default is `sftp`.

`SFTP_PASS`: optional, clear text password to access the server.
If empty, password is disabled.
Default is empty.

`SFTP_PASSFILE`: optional, file containing the clear text password.
Default is `/run/docker/secrets/sftp-pass`.
If non empty, it will override `SFTP_PASS`.

If both `SFTP_PASS` and `SFTP_PASSFILE` are empty or not set, password
authentication is disabled.

`SFTP_PUBKEY`: rsa public key to add to `authorized_keys`
Default is `/run/docker/secrets/sftp-id_rsa.pub`.

You **may** bind mount your local rsa pub key:
```bash
docker run --rm -d --name sftp -p 222:22 \
  -e SFTP_PUBKEY=/key/id_rsa.pub \
  -v $HOME/.ssh/id_rsa.pub:/key/id_rsa.pub:ro \
  0lfi/sftp
```
You **should** bind mount an rsa pub pub key **read only**.

Best practice in a Docker Swarm environment is to use `docker secret`:
```bash
cat /path/to/id_rsa.pub | docker secret create sftp-id_rsa.pub -
```

