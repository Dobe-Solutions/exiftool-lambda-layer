#!/bin/bash

while test $# -gt 0; do
    case "$1" in
        --config*)
            configuration=`echo $1 | sed -e 's/^[^=]*=//g'`
            shift
            ;;
        *)
            break
            ;;
    esac
done

echo $configuration

docker build . -t exiftool-lambda-layer --build-arg="CONFIG=`echo $configuration | grep -q 'all' && echo 'all' || echo $configuration`"
CONTAINER=$(docker create exiftool-lambda-layer)

docker cp $CONTAINER:/tmp/exiftool-lambda-layer.zip .