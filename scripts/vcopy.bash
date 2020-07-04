#!/bin/bash

# copy volume $1 to volue $2
docker run -it -v $1:/src -v $2:/dst alpine cp -al /src /dst
