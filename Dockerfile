FROM tomcat:8.5.40-jre8
WORKDIR  /usr/local/tomcat
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY ./target/app-2.5-SNAPSHOT.war /usr/local/tomcat/webapps/myapp.war
