FROM ubuntu:22.04 as builder

RUN apt-get update && \
	apt-get install -qq -y wget vim && \
	apt-get install -qq -y openjdk-8-jdk && \
	apt-get install -qq -y git && \
	apt-get install dumb-init
	
RUN git clone https://github.com/Netflix/ndbench.git /opt/ndbench && \
	rm -rf /opt/ndbench/ndbench-cockroachdb-plugins && \
	rm -rf /opt/ndbench/ndbench-dax-plugins && \
	rm -rf /opt/ndbench/ndbench-dynamodb-plugins && \
	rm -rf /opt/ndbench/ndbench-dyno-plugins && \
	rm -rf /opt/ndbench/ndbench-es-plugins && \
	rm -rf /opt/ndbench/ndbench-geode-plugins && \
	rm -rf /opt/ndbench/ndbench-janusgraph-plugins && \
	rm -rf /opt/ndbench/ndbench-aws && \
	rm -rf /opt/ndbench/ndbench-web/src/test

COPY ndbench.properties /opt/ndbench/ndbench-core/src/main/resources/application.properties

WORKDIR /opt/ndbench
RUN ./gradlew clean build war


FROM tomcat:8.5.84-jdk8-temurin-focal
COPY --from=builder /opt/ndbench/ndbench-web/build/libs/ndbench-web-0.8.0-SNAPSHOT.war /usr/local/tomcat/webapps
ENV DISCOVERY_ENV_AWS_CONFIG_FILE=CONFIG_FILE
ENV CATALINA_OPTS="$CATALINA_OPTS -Dtomcat.util.http.parser.HttpParser.requestTargetAllow=|{}"
EXPOSE 8080/tcp
ENTRYPOINT ["catalina.sh", "run"]
