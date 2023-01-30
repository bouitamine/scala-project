FROM openjdk:8-jdk-alpine

RUN apk add --no-cache wget && \
    wget https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz && \
    tar xzf spark-2.4.6-bin-hadoop2.7.tgz && \
    mv spark-2.4.6-bin-hadoop2.7 /spark

ENV SPARK_HOME /spark
ENV PATH $SPARK_HOME/bin:$PATH

COPY target/scala-project-1.0-SNAPSHOT.jar /app/scala-project-1.0-SNAPSHOT.jar

CMD ["spark-submit", "--class", "com.bouitamine.App", "--master", "local[*]", "/app/scala-project-1.0-SNAPSHOT.jar"]