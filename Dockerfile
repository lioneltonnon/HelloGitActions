# Use the official OpenJDK 17 runtime as a parent image
FROM openjdk:17-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the Maven build file and source code
COPY pom.xml /app
COPY src /app/src

# Build the application
RUN ./mvnw clean package

# Copy the built jar to the final image
COPY target/helloworld-1.0-SNAPSHOT.jar app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
