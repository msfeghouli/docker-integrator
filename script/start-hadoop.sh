#!/bin/bash

set -x

start-dfs.sh
start-yarn.sh

mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver
