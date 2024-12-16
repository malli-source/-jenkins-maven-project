FROM openjdk
WORKDIR /app
COPY test\first-app\first-app/target/first-app-1.0.jar /app
CMD /usr/bin/java -Xmx400m -Xms400m -jar first-app-1.0.jar
EXPOSE 8081
