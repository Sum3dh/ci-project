# Stage 1: Build the java app
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:gp-offline
COPY src/ .
RUN mvn [ackage -DskipTests

# Stage 2: Run the Java Application
FROM eclips-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/target/my-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
