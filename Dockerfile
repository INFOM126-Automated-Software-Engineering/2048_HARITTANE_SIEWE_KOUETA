# Use an OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build output into the Docker image
COPY target/*.jar app.jar

# Expose DISPLAY environment variable for X11
ENV DISPLAY=:0

# Run the application
CMD ["java", "-jar", "app.jar"]