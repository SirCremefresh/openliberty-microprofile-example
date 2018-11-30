rmdir /s /q ".\wlp"

mvn -f ../pom.xml clean net.wasdev.wlp.maven.plugins:liberty-maven-plugin:2.5:install-server

move "..\target\liberty\wlp" ".\wlp"

"wlp/bin/server.bat" create "openliberty-microprofile-example"
