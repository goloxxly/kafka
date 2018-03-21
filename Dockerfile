FROM java:openjdk-8-jre

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 1.0.1
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

RUN curl http://apache.mirror.anlx.net/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz | tar -xz -C /opt
ADD run.sh $KAFKA_HOME/
RUN chmod +x $KAFKA_HOME/run.sh

WORKDIR $KAFKA_HOME
ENTRYPOINT ["./run.sh"]
