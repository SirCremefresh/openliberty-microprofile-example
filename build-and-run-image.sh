#!/usr/bin/env bash

./build-image.sh

docker run -p 9080:9080 -l openliberty-microprofile-example openliberty-microprofile-example