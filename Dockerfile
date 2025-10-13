# Step 1: Use Maven to build the WAR
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy your pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the WAR file
RUN mvn clean package -DskipTests

# Step 2: Use Tomcat to run it
FROM tomcat:11-jdk17

# Remove default ROOT web app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy WAR from the Maven builder stage
COPY --from=builder /app/target/vogg.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
