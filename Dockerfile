FROM openjdk:11-jdk as backend

EXPOSE 8080

ENV TZ=Europe/Moscow

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl jq \
    && rm -rf /var/lib/apt/lists/*

COPY ./target/demo-0.0.1-SNAPSHOT.jar /opt/app/app.jar

WORKDIR /opt/app

ENTRYPOINT ["java", \
    "-Djava.security.egd=file:/dev/./urandom", \
    "-Dspring.profiles.active=local", \
    "-jar", "/opt/app/app.jar" \
    ]

HEALTHCHECK --start-period=15s --interval=1m --timeout=10s --retries=5 \
    CMD curl --silent --fail --request GET http://localhost:8080/health \
    | jq --exit-status '.status == "UP"' || exit 1