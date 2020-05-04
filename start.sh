#!/bin/sh
# starts a arch container

if [[ ! -z $1 ]]; then
    sudo docker run -ti --name $1 -v /mnt/container/$1/home:/home:rw -v /mnt/pkg:/mnt/pkg:rw -d emileet/arch
else
    echo "please provide a container name"
fi
