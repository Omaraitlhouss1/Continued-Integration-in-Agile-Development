# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Install OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk

# Install Maven
RUN apt-get install -y maven

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project into the container
COPY . .

# Expose port 8080
EXPOSE 8082

# Command to run the Spring Boot application
CMD ["mvn", "spring-boot:run"]
