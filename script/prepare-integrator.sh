#!/bin/bash

set -x

./prepare-all-metatron.sh

# oozie, integrator
./init-oozie-metastore.sh
./start-oozie.sh

sleep 3

./init-integrator-metatstore.sh
./start-integrator.sh

