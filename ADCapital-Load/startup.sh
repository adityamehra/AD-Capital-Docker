#!/bin/bash

source env.sh

dockerize -wait tcp://portal:8080 -wait-retry-interval ${RETRY} -timeout ${TIMEOUT}
dockerize -wait tcp://processor:8080 -wait-retry-interval ${RETRY} -timeout ${TIMEOUT}

$LOAD_GEN_HOME/bin/AD-Capital-Load $PORTAL_URL $PROCESSOR_URL
