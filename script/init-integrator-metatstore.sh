#!/bin/bash

set -x

PASSWORD=Metatron123$

expect -c "
set timeout 3
spawn mysql -uroot -p
expect \"Enter password:\"
send \"$PASSWORD\\r\"
expect \"mysql>\"
send \"create database integrator;\\r\"
expect \"mysql>\"
send \"create user 'integrator'@'%' identified by '$PASSWORD';\\r\"
expect \"mysql>\"
send \"grant all privileges on *.* to 'integrator'@'%';\\r\"
expect \"mysql>\"
send \"grant all privileges on integrator.* to 'integrator'@'%';\\r\"
expect \"mysql>\"
send \"create user 'integrator'@'localhost' identified by '$PASSWORD';\\r\"
expect \"mysql>\"
send \"grant all privileges on *.* to 'integrator'@'localhost';\\r\"
expect \"mysql>\"
send \"grant all privileges on integrator.* to 'integrator'@'localhost';\\r\"
expect \"mysql>\"
send \"flush privileges;\\r\"
expect \"mysql>\"
send \"quit\\r\"
expect eof
"

#schematool -initSchema -dbType mysql
hdfs dfs -mkdir -p /user/metatron/integrator/workflow
hdfs dfs -mkdir -p /user/metatron/integrator/coordinator
hdfs dfs -mkdir -p /user/metatron/integrator/task
hdfs dfs -put -f $INTEGRATOR_HOME/ext_scripts /user/metatron/integrator
hdfs dfs -put -f $INTEGRATOR_HOME/sample /user/metatron/integrator

