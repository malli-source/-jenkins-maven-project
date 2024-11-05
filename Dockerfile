FROM openjdk:11.0.2-jre-slim
COPY target/first-app-1.0.jar .
CMD /usr/bin/java -Xmx400m -Xms400m -jar first-app-1.0.jar
EXPOSE 8080
