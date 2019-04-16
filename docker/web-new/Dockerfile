FROM tomcat:8-jre8-alpine

RUN wget https://github.com/tango-controls/waltz/releases/download/v0.6.1/TangoWebapp.war \
    -P /usr/local/tomcat/webapps

COPY resources/tomcat-users.xml /usr/local/tomcat/conf/
