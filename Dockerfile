FROM bellsoft/liberica-openjdk-debian:17

COPY ["bin", "/opt/apache-kafka/bin"]
COPY ["config", "/opt/apache-kafka/config"]
COPY ["libs", "/opt/apache-kafka/libs"]
COPY ["licenses", "/opt/apache-kafka/licenses"]
COPY ["site-docs", "/opt/apache-kafka/site-docs"]
COPY ["LICENSE", "NOTICE", "/opt/apache-kafka/"]

WORKDIR "/opt/apache-kafka"

EXPOSE 9092 9093
VOLUME ["/var/lib/apache-kafka"]

ENTRYPOINT ["java"]
CMD [ \
     "-Dlog4j.configuration=file:/opt/apache-kafka/config/log4j.properties", \
     "-Xmx1G","-Xms1G", \
     "-classpath","libs/*", \
     "kafka.Kafka","/opt/apache-kafka/config/kraft/server.properties", \
     "--override","log.dirs=/var/lib/apache-kafka" \
]
