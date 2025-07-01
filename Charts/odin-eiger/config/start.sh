#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
fastcs-odin ioc {{ .Values.pvPrefix }} --ip {{ .Values.detectorName }}-odin-server --port 8888
