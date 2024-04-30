#!/bin/sh
docker build . -t exiftool-lambda-layer
docker create --name exiftool-output-layer exiftool-lambda-layer

docker cp exiftool-output-layer:/tmp/exiftool-lambda-layer.zip .