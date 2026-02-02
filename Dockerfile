# Стадия сборки
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests  # можно убрать -DskipTests, если хочешь тесты в билде

# Стадия запуска
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/calculator-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]