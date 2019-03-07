#!/usr/bin/env bash

echo "Before cleaning:"
df -h | grep /dev/sda1

# stop all containers
docker kill $(docker ps -a -q)

# remove all containers
docker rm $(docker ps -a -q)

# remove images
docker rmi $(docker images -q)

# make clean-up
docker system prune -a

sudo apt-get -y remove docker-ce
sudo apt-get -y remove gimp
sudo apt-get -y clean
sudo apt-get -y autoclean
sudo apt-get -y autoremove --purge
rm -rf /home/tango-cs/.cache/*
sudo rm -rf /home/tango-cs/work/tangobox/build/*

echo "After cleaning:"
df -h | grep /dev/sda1

cd ~/bin
ln -s ~/work/tangobox/src/tangobox/scripts/make-containers.sh
