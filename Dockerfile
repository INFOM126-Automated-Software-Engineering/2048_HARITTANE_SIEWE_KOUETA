# Use an OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Install required libraries for GUI and font rendering
RUN apt-get update && apt-get install -y \
    libfreetype6 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    fonts-dejavu-core \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build output into the Docker image
COPY target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
