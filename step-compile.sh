#!/bin/bash

set -e

RUN_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $RUN_PATH

DOCKER_IMAGE=fcloud-prebuilt-haproxy

echo ----[ Create build directory ]----
mkdir -p build

echo ----[ Prepare build docker image ]----
cd docker
docker build -t $DOCKER_IMAGE .

echo ----[ Compile ]----
docker run -i --rm \
    --volume $RUN_PATH/build:/build \
    --user $(id -u) \
    $DOCKER_IMAGE \
    /compile.sh
