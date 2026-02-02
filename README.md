# CalculatorTests

Простой калькулятор на Java (Maven + JDK 17) с юнит-тестами и CI/CD.

## Что внутри

- Класс `Calculator` с методами: add, subtract, multiply, divide  
- Юнит-тесты на JUnit 5  
- Executable JAR (с main-методом, выводит примеры расчётов)  

## CI/CD

Настроен GitHub Actions:
- Сборка и тесты на **трёх ОС**: Linux, Windows, macOS (JDK 17)  
- Автоматический запуск при push / pull request в main  

Файл workflow: `.github/workflows/ci-cd.yml`

## Деплой

Автоматический деплой на **Render.com** через Docker после успешного CI.  
Приложение запускается, выводит расчёты в логи.

## Как запустить локально

```bash
mvn clean package
java -jar target/calculator-1.0-SNAPSHOT.jar
