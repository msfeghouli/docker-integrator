#!/bin/bash

sudo docker build -t teamsprint/integrator:3.0.0 --build-arg INTEGRATOR_WAR=`ls integrator-*.war` --build-arg DRUID_TASK_JAR=metatron-integrator-druid.jar .

