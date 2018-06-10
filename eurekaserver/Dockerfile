FROM openjdk:8-alpine

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
ADD lib                  /usr/share/app/lib
# Add the service itself
ADD APP_NAME-APP_VERSION.jar /usr/share/app/app.jar

WORKDIR /usr/share/app

ENTRYPOINT ["/usr/bin/java", "-jar", "-Dspring.profiles.active=native", "app.jar"]

