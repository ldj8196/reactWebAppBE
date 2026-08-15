# 1단계: 빌드 스테이지 (Gradle을 이용해 jar 파일 생성)
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# 프로젝트 파일 전체 복사
COPY . .

# 윈도우/맥에서 빌드할 때 생긴 gradlew 권한 문제 방지 및 빌드 실행
RUN chmod +x ./gradlew
RUN ./gradlew clean bootJar

# 2단계: 실행 스테이지 (가벼운 JRE 환경에서 jar 실행)
FROM eclipse-temurin:17-jre
WORKDIR /app

# 빌드 스테이지에서 생성된 jar 파일을 복사해 옴 (파일명은 본인 프로젝트에 맞게 수정 필요)
COPY --from=builder /app/build/libs/*.jar app.jar

# 앱이 사용할 포트 (예: 8080)
EXPOSE 8080

# 컨테이너 실행 시 jar 파일 실행
ENTRYPOINT ["java", "-jar", "app.jar"]