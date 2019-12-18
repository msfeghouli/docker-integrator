#!/bin/bash

set -x

cd $INTEGRATOR_HOME
./integrator.sh start

tail -f app.log
