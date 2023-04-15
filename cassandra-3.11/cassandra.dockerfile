FROM ubuntu:22.04

RUN apt-get update && \
	apt-get install -qq -y wget vim && \
	apt-get install -qq -y openjdk-8-jdk && \
	apt-get install -qq -y python2.7

RUN wget https://dlcdn.apache.org/cassandra/3.11.14/apache-cassandra-3.11.14-bin.tar.gz -P /tmp && \
	tar -xvf /tmp/apache-cassandra-3.11.14-bin.tar.gz -C /opt && \
	wget https://github.com/instaclustr/cassandra-exporter/releases/download/v0.9.10/cassandra-exporter-agent-0.9.10.jar -P /opt/apache-cassandra-3.11.14/lib && \
	wget https://github.com/jiaqi/jmxterm/releases/download/v1.0.2/jmxterm-1.0.2-uber.jar -P /opt/apache-cassandra-3.11.14/lib && \
	rm -rf /tmp/*
COPY cassandra-conf.yaml /opt/apache-cassandra-3.11.14/conf/cassandra.yaml

RUN useradd -U cass
RUN chown -R cass /opt/apache-cassandra-3.11.14 && \
	chgrp -R cass /opt/apache-cassandra-3.11.14 && \
	chmod o+x /opt/apache-cassandra-3.11.14
USER cass

ENV JVM_EXTRA_OPTS="-javaagent:/opt/apache-cassandra-3.11.14/lib/cassandra-exporter-agent-0.9.10.jar=--listen=:9191"

EXPOSE 9191/tcp 9500/tcp 9042/tcp

ENTRYPOINT ["/opt/apache-cassandra-3.11.14/bin/cassandra", "-f"]