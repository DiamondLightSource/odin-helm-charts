#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
fastcs-jungfrau run /epics/ioc/fastcs/fastcs.yaml
