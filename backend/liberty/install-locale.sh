#!/usr/bin/env bash

rm -r "./wlp"

mvn -f ../pom.xml clean net.wasdev.wlp.maven.plugins:liberty-maven-plugin:2.5:install-server

mv "../target/liberty/wlp" "./wlp"

"wlp/bin/server" create "openliberty-microprofile-example"

cp -f "./config/server-locale.xml" "wlp/usr/servers/openliberty-microprofile-example/server.xml"
cp -f "./config/jvm.options-locale" "wlp/usr/servers/openliberty-microprofile-example/jvm.options"

elasticAgentLocation=$(pwd)"/wlp/elastic-apm-agent-1.1.0.jar"
wget -O ${elasticAgentLocation} "https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/1.1.0/elastic-apm-agent-1.1.0.jar"
sed -i "s~\${elastic-agent-location}~$elasticAgentLocation~" "wlp/usr/servers/openliberty-microprofile-example/jvm.options"

postgresqlDriverLocation=$(pwd)"/wlp/lib/postgresql-42.2.5.jar"
wget -O ${postgresqlDriverLocation} https://jdbc.postgresql.org/download/postgresql-42.2.5.jar

"wlp/bin/installUtility" install microprofile-2.0 jpa-2.2 --acceptLicense
