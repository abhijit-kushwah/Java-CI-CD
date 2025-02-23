FROM openjdk:8
EXPOSE 8080
ADD target/java-ci-cd.jar java-ci-cd.jar
ENTRYPOINT ["java", "-jar","/java-ci-cd.jar"]