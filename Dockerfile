FROM eclipse-temurin:11-jre
MAINTAINER Pavol Loffay <ploffay@redhat.com>
ENV APP_HOME /app/
COPY jaeger-spark-dependencies/target/jaeger-spark-dependencies-0.0.2-SNAPSHOT.jar $APP_HOME/

WORKDIR $APP_HOME

COPY entrypoint.sh /

RUN chgrp root /etc/passwd && chmod g+rw /etc/passwd
USER 185

ENTRYPOINT ["/entrypoint.sh"]
CMD java ${JAVA_OPTS} -jar $APP_HOME/jaeger-spark-dependencies-0.0.2-SNAPSHOT.jar
