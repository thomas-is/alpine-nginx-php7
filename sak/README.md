# SAK - Swiss Army Knife / Sys Admin Kit

## Usage

This image is meant to be used as an **temporary** container.

Its default `CMD` is a login shell (`sh -l`), it will **not** run as a service.


## Quick start
```
docker run --rm -it \
  --network some_attachable_network \
  -v ~/.ssh:/root/.ssh:ro \ # if needed
  -v $(pwd):/host \ # if needed
  0lfi/sak
```

