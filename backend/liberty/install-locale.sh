#!/usr/bin/env bash

rm -r "./wlp"

mvn -f ../pom.xml clean net.wasdev.wlp.maven.plugins:liberty-maven-plugin:2.5:install-server

mv "../target/liberty/wlp" "./wlp"

"wlp/bin/server" create "openliberty-microprofile-example"

cp -f "./config/server-locale.xml" "wlp/usr/servers/openliberty-microprofile-example/server.xml"
cp -f "./config/jvm.options-locale" "wlp/usr/servers/openliberty-microprofile-example/jvm.options"

"wlp/bin/installUtility" install microprofile-2.0 --acceptLicense
