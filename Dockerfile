FROM maven:3.9.9-eclipse-temurin-23

ARG APP_DIR=/app

WORKDIR ${APP_DIR}

COPY mvnw .
COPY mvnw.cmd .
COPY pom.xml .
COPY .mvn .mvn
COPY src src

RUN mvn package -Dmaven.test.skip=true

ENV INSTANCE_NAME="Spring Dov Bear"
ENV INSTANCE_HASH="Fahmy"

ENV SERVER_PORT=3000

EXPOSE ${SERVER_PORT}

ENTRYPOINT SERVER_PORT=${SERVER_PORT} java -jar target/dovbear-0.0.1-SNAPSHOT.jar