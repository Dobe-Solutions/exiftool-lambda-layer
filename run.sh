#!/bin/sh
docker build . -t exiftool-lambda-layer
CONTAINER=$(docker create exiftool-lambda-layer)

docker cp $CONTAINER:/tmp/exiftool-lambda-layer.zip .