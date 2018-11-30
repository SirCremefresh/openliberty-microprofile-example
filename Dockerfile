FROM open-liberty:microProfile2

ADD mongo/mongodb-driver.jar /opt/ol/wlp/usr/shared/resources/

ADD liberty/config/server.xml /config/
ADD target/openliberty-microprofile-example.war /config/apps