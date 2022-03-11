FROM gradle AS cache
WORKDIR /app
ENV GRADLE_USER_HOME /cache
COPY build.gradle ./
RUN gradle --no-daemon build --stacktrace

FROM gradle AS build
WORKDIR /app
COPY --from=cache /cache /home/gradle/.gradle
COPY . .
RUN gradle --no-daemon shadowJar --stacktrace

FROM openjdk
COPY --from=build /app/build/libs/*-all.jar /app.jar
EXPOSE 8080
ENTRYPOINT exec java -jar app.jar
