FROM maven:3.6.1-jdk-11 AS MAVEN_BUILD

COPY ./ ./

RUN mvn clean package -Dmaven.test.skip
FROM openjdk:11-jdk

COPY --from=MAVEN_BUILD /target/*.jar /booking.jar

CMD ["java", "-jar", "/booking.jar"]