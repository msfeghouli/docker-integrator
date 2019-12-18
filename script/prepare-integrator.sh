#!/bin/bash

set -x

./prepare-all-metatron.sh

./init-oozie-metastore.sh
./start-oozie.sh

sleep 3

./init-integrator-metatstore.sh
./start-integrator.sh

