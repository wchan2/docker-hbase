FROM ubuntu
MAINTAINER William Chan <wchan@shopkeep.com>

RUN apt-get update && apt-get install -y build-essential openjdk-7-jdk

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN mkdir -p /opt/downloads

ADD http://mirrors.sonic.net/apache/hbase/hbase-1.0.1/hbase-1.0.1-bin.tar.gz /opt/downloads/

WORKDIR /opt/downloads
RUN tar -xvf /opt/downloads/hbase-1.0.1-bin.tar.gz -C /opt/
RUN mv /opt/hbase-1.0.1 /opt/hbase

COPY conf/hbase-site.xml /opt/hbase/conf/
RUN mkdir -p /opt/tmp/zookeeper

EXPOSE 2181 60000 60010 60020 60030

ENTRYPOINT ["/opt/hbase/bin/hbase"]
CMD ["master", "start"]