#!/bin/bash
REPO=063507218586.dkr.ecr.eu-central-1.amazonaws.com/geth

function build() {
    TAG=$1
    echo "Building for tag ${TAG}"
    docker build -t geth:$TAG -f Dockerfile.staging --build-arg TESTNET=$2 .
    docker tag geth:$TAG $REPO:$TAG
    docker push $REPO:$TAG
};
build testnet 1
build public
