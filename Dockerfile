FROM openjdk:11 as build

WORKDIR /workspace/app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN ./gradlew build -x test
##RUN mkdir -p build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

FROM openjdk:11
WORKDIR /app/lib
ARG DEPENDENCY=/workspace/app/
COPY --from=build ${DEPENDENCY}/build/libs/helloapp-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
ENTRYPOINT ["java","-jar","helloapp-0.0.1-SNAPSHOT.jar"]