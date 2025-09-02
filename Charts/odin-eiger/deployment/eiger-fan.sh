#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
sleep 5
/odin/bin/eigerfan \
    --addr {{ .Values.detectorIp }} \
    --consumers {{ .Values.odinDataCount }} \
    --context-threads 4 \
    --blocksize 1000 \
    --threads 2 \
    --logconfig $SCRIPT_DIR/log4cxx.xml
