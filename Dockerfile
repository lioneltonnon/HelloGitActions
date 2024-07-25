# Stage 1: Build the application using Maven
FROM maven:3.8.1-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven build file and source code
COPY pom.xml /app
COPY src /app/src

# Build the application
RUN mvn clean package

# Stage 2: Run the application using OpenJDK 17
FROM openjdk:17-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the built jar from the Maven image
COPY --from=build /app/target/helloworld-1.0-SNAPSHOT.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
