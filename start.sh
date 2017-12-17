#!/bin/bash

#stop all containers 
docker stop userMngrdb userMngrApp

#remove stopped containers
docker rm userMngrdb userMngrApp

#build the docker image
docker build -t abdulbasitkay/alc-usermngr:devops .

docker run -d --name userMngrdb -v $(pwd)/data:/data/db mvertes/alpine-mongo
docker run -d --name userMngrApp --link userMngrdb:db -p 3000:3000 abdulbasitkay/alc-usermngr:devops