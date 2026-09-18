FROM eclipse-temurin:17-jre

WORKDIR /app

COPY target/devops-project-1.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
