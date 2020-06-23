# sak

A swiss army knife based on alpine

## Usage
Run it detached 
```
docker run --rm -d --hostname box -v ~/.ssh:/root/.ssh:ro 0lfi/sak
```
then attach with
```
docker exec box tmux
```
