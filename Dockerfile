FROM maven: AS build

COPY . /src
WORKDIR /src

RUN mvn package 

FROM jetty:11.0.9-openjdk as target

COPY --from=build /src/target/bastillion-*.war /var/lib/jetty/webapps/ROOT.war
EXPOSE 8080
