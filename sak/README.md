# SAK - Swiss Army Knife / Sys Admin Kit

```
docker run --rm -it \
  --network some_network \
  -v ~/.ssh:/root/.ssh:ro \
  -v $(pwd):/host \
  0lfi/sak
```
