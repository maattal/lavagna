FROM maven:3.8.3-ibmjava-8-alpine AS build
WORKDIR /build

COPY src ./src/
COPY pom.xml .
COPY LICENSE-GPLv3.txt .
RUN mvn verify

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /build/target ./target
ENV DB_DIALECT HSQLDB
ENV DB_URL jdbc:hsqldb:file:lavagna
ENV DB_USER sa
ENV DB_PASS ""
ENV SPRING_PROFILE dev
RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl

#wait for
ADD https://raw.githubusercontent.com/eficode/wait-for/master/wait-for .
RUN chmod 755 wait-for

COPY entry-point.sh .
ENTRYPOINT ./entry-point.sh
