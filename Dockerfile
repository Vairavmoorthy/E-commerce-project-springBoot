FROM openjdk:17-jdk-slim
COPY ./target/JtSpringProject-0.0.1-SNAPSHOT.jar vmapp.jar
CMD java -jar vmapp.jar
