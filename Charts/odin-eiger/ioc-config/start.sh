#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
fastcs-eiger run /epics/ioc/fastcs.yaml
