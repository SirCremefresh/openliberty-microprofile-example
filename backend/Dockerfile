FROM maven:3.6.0-jdk-8-alpine as builder
ADD pom.xml /tmp/pom.xml
RUN mvn -f /tmp/pom.xml dependency:resolve
ADD src tmp/src
RUN mvn -f /tmp/pom.xml install

FROM open-liberty:microProfile2
ADD "https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/1.1.0/elastic-apm-agent-1.1.0.jar" /tmp/elastic-apm-agent.jar
ADD "https://jdbc.postgresql.org/download/postgresql-42.2.5.jar" /opt/ol/wlp/lib/postgresql-42.2.5.jar
ADD liberty/config/jvm.options /config/
ADD liberty/config/server.xml /config/

RUN /opt/ol/wlp/bin/server start && /opt/ol/wlp/bin/server stop && rm -rf /output/resources/security/

COPY --from=builder /tmp/target/openliberty-microprofile-example.war /config/apps