# Стадия сборки: Maven + JDK 17
FROM maven:3.9.9-eclipse-temurin-17 AS builder

WORKDIR /build

# Копируем pom.xml для кэширования зависимостей
COPY pom.xml .

# Скачиваем зависимости
RUN mvn dependency:go-offline -B

# Копируем исходный код
COPY src ./src

# Собираем проект
RUN mvn clean package -DskipTests

# Стадия запуска: только JRE 17
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Копируем готовый executable JAR
COPY --from=builder /build/target/calculator-1.0-SNAPSHOT.jar app.jar

# Запуск приложения
CMD ["java", "-jar", "app.jar"]