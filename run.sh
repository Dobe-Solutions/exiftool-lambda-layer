#!/bin/sh
docker build . -t exiftool-lambda-layer
docker create --name output-layer exiftool-lambda-layer

docker cp output-layer:/tmp/exiftool-lambda-layer.zip .