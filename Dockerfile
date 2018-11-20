FROM open-liberty:microProfile2

ADD liberty/server.xml /config/
ADD target/openliberty-microprofile-example.war /config/dropins