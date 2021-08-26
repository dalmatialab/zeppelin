FROM apache/zeppelin:0.8.0
LABEL maintainer="dalmatialab"

# Environment variables
ENV SPARK_VERSION=2.4.8
ENV HADOOP_SPARK_VERSION=2.7
ENV GEOMESA_VERSION=2.11-3.1.0
ENV SPARK_HOME=/opt/spark
ENV ACCUMULO_MAJOR_VERSION=2

# Adding on path
ENV PATH $SPARK_HOME/bin:$PATH

RUN cd / && mkdir spark

# Spark installatin
RUN mkdir -p /opt/spark/
RUN cd /opt/spark && wget https://downloads.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_SPARK_VERSION}.tgz \
                  && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_SPARK_VERSION}.tgz --strip-components 1 \
                  && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_SPARK_VERSION}.tgz

# Geomesa runtime
RUN cd /tmp && wget https://github.com/locationtech/geomesa/releases/download/geomesa_$GEOMESA_VERSION/geomesa-accumulo_$GEOMESA_VERSION-bin.tar.gz \
            && tar -xvzf geomesa-accumulo_$GEOMESA_VERSION-bin.tar.gz \
            && cp geomesa-accumulo_${GEOMESA_VERSION}/dist/spark/geomesa-accumulo-spark-runtime-accumulo${ACCUMULO_MAJOR_VERSION}_${GEOMESA_VERSION}.jar ${SPARK_HOME}/jars \
            && rm -rf geomesa-accumulo_${GEOMESA_VERSION} && rm geomesa-accumulo_${GEOMESA_VERSION}-bin.tar.gz

COPY src/zeppelin-site.xml /zeppelin/conf/
COPY conf/helium.json /zeppelin/conf/
COPY src/shiro.ini /zeppelin/conf/

WORKDIR /zeppelin

CMD ["bin/zeppelin.sh"]

