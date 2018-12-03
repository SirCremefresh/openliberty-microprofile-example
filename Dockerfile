FROM maven:3.6.0-jdk-8-alpine as builder
ADD pom.xml tmp/pom.xml
ADD src tmp/src
RUN mvn -B -f /tmp/pom.xml install

FROM open-liberty:microProfile2

ADD liberty/config/server.xml /config/
COPY --from=builder /tmp/target/openliberty-microprofile-example.war /config/apps