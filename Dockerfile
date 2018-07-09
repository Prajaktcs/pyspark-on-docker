FROM openjdk:8

MAINTAINER prajakt.shastry@gmail.com

ENV SPARK_VERSION=2.3.1
ENV HADOOP_VERSION=2.7
ENV SPARK_HOME=/spark

COPY src /app
WORKDIR /app

RUN apt-get update && apt-get install -y python3 python3-setuptools python3-pip

RUN wget http://www-eu.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME} \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

COPY spark-templates/spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf
COPY spark-templates/spark-env.sh ${SPARK_HOME}/conf/spark-env.sh


