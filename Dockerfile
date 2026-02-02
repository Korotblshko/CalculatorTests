# Стадия сборки: Maven + JDK 21
FROM maven:3.9.9-eclipse-temurin-21 AS builder

WORKDIR /build

# Сначала копируем pom.xml для кэширования зависимостей
COPY pom.xml .

# Скачиваем зависимости (кэшируется)
RUN mvn dependency:go-offline -B

# Копируем исходники
COPY src ./src

# Собираем
RUN mvn clean package -DskipTests

# Стадия запуска: только JRE 21
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Копируем готовый JAR
COPY --from=builder /build/target/calculator-1.0-SNAPSHOT.jar app.jar

# Запуск приложения
CMD ["java", "-jar", "app.jar"]