# Use an OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Install necessary dependencies for X11 forwarding
RUN apt-get update && apt-get install -y \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build output into the Docker image
COPY target/*.jar app.jar

# Expose DISPLAY environment variable for X11
ENV DISPLAY=:0

# Run the application
CMD ["java", "-jar", "app.jar"]