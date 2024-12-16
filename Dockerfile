FROM openjdk
WORKDIR /app
ADD C:\ProgramData\Jenkins\.jenkins\workspace\test\first-app\first-app\target\first-app-1.0.jar /app
ENTRYPOINT ['/usr/bin/java','-jar','/app/first-app-1.0.jar']
EXPOSE 8081
