#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
stdio-expose --ptty --stdin --ctrl-d 'fastcs-jungfrau ioc {{ .Values.pvPrefix }} --config {{ .Values.configFilePath }} --odin-ip {{ .Values.detectorName }}-odin-server --odin-port 8888'
