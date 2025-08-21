# 빌드 단계 (멀티 스테이지)
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app

# 의존성 먼저 복사 (캐싱 목적)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 소스 복사 후 빌드
COPY src ./src
RUN mvn clean package -DskipTests

# 실행 단계
FROM openjdk:17
WORKDIR /app

# 빌드 단계에서 나온 jar 복사
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
