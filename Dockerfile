FROM gradle:8.0.2-jdk17 AS mbuilder 
COPY ./config-service /usr/src/
WORKDIR /usr/src/
RUN gradle wrapper --gradle-version 8.0.2
RUN ./gradlew build 

FROM openjdk:21-ea-17-jdk-slim
COPY --from=mbuilder /usr/src/build/libs/config-service-0.0.1-SNAPSHOT.jar /usr/src/
CMD ["java","-jar","/usr/src/config-service-0.0.1-SNAPSHOT.jar"] 