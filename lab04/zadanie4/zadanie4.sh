#!/bin/bash

all_volumes_path="/var/lib/docker/volumes"
volume_name="zadanie4_volume"

passphrase="password123"

docker volume create $volume_name

volume_path=$(docker volume inspect $volume_name | grep "Mountpoint" | awk '{print $2}' | tr -d '"' | tr -d ",")

tar -cvzf ${volume_name}.tar $volume_path 
gpg --batch --passphrase $passphrase -c ${volume_name}.tar
tar -cvzf all_volumes.tar $all_volumes_path 
gpg --batch --passphrase $passphrase -c all_volumes.tar

rm all_volumes.tar
rm ${volume_name}.tar

gpg --batch --passphrase $passphrase -o ${volume_name}.tar -d ${volume_name}.tar.gpg

tar -xvzf ${volume_name}.tar

rm ${volume_name}.tar.gpg