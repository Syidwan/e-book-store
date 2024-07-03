# FROM openjdk:11
# EXPOSE 8080
# ADD target/bookstore.jar bookstore.jar
# ENTRYPOINT ["java", "-jar", "/bookstore.jar"]

FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/bookstore.jar"]