#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# Increase maximum fds available for ZeroMQ sockets
ulimit -n 2048

sleep 3

/venv/bin/eiger_control \
    --config=$SCRIPT_DIR/odin-server.cfg \
    --logging=info \
    --access_logging=ERROR
