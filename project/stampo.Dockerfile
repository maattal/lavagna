FROM maven:3.8.3-ibmjava-8-alpine 
WORKDIR /build_stampo

COPY ./pom.xml .
COPY src/main/stampo ./src/main/stampo
COPY ./target ./target
RUN mvn clean stampo:build

ENTRYPOINT mvn stampo:serve 

