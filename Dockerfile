FROM teamsprint/oozie:4.3

MAINTAINER Jungil Park, Jooho Kim

USER root

# Build with --build-arg INTEGRATOR_WAR=<INTEGRATOR_WAR>
# ex> docker build -t teamsprint/integrator:3.0.0 --build-arg INTEGRATOR_WAR=`ls integrator-*.war` DRUID_TASK_JAR=metatron-integrator-druid.jar .

ARG INTEGRATOR_WAR
ARG DRUID_TASK_JAR

ENV INTEGRATOR_HOME /servers/metatron-integrator


# setting metatron-integrator files
RUN mkdir $INTEGRATOR_HOME
RUN cd $INTEGRATOR_HOME; mkdir bin; mkdir var; mkdir ext_scripts; cd ..
ADD $INTEGRATOR_WAR $INTEGRATOR_HOME/bin
ADD $DRUID_TASK_JAR $INTEGRATOR_HOME/ext_scripts
ADD script/integrator.sh $INTEGRATOR_HOME
ADD conf/application.yml $INTEGRATOR_HOME
COPY sample $INTEGRATOR_HOME/sample

# modify metatron-discovery configuration
ADD conf/application-config.yaml $METATRON_HOME/conf

# modify hadoop configuration
ADD conf/core-site.xml $HADOOP_CONF_DIR
ADD conf/mapred-site.xml $HADOOP_CONF_DIR
ADD script/start-hadoop.sh /

ADD Dockerfile /
ADD README.md /

ADD script/integrator_init_db.sql /
ADD script/init-integrator-metatstore.sh /
ADD script/start-integrator.sh /
ADD script/stop-integrator.sh /
ADD script/prepare-integrator.sh /

CMD ["/bin/bash"]

# Integrator port
EXPOSE 8280

