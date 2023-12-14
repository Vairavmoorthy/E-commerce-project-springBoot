FROM openjdk:17-jdk-slim
COPY /var/lib/jenkins/workspace/ecom/JtProject/target/JtSpringProject-0.0.1-SNAPSHOT.jar  vmapp.jar
CMD java -jar vmapp.jar
