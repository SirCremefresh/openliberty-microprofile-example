#!/usr/bin/env bash

mvn clean install

mkdir -p mongo

if [[ ! -f mongo/mongodb-driver.jar ]]; then
    echo "File not found!"
    wget -O mongo/mongodb-driver.jar -P mongo http://central.maven.org/maven2/org/mongodb/mongodb-driver-sync/3.9.0/mongodb-driver-sync-3.9.0.jar
fi

docker build -t openliberty-microprofile-example .