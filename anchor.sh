#!/bin/bash

IMAGE_NAME="anchor"
PROJ_NAME=${PWD##*/}
PROJ_NAME=${PROJ_NAME:-/}

build() {
  docker build -t $IMAGE_NAME \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg USERNAME=$(whoami) \
    --build-arg PROJNAME=$PROJ_NAME \
    .
}

run() {
  docker run --rm -it -v `pwd`:/home/$(whoami)/$PROJ_NAME $IMAGE_NAME
}

if [ "$1" = "build" ]; then
  build
elif [ "$1" = "run" ]; then
  run
else
  echo Command \'$1\' not recognised
fi