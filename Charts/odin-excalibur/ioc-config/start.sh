#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
stdio-expose --ptty --stdin --ctrl-d 'fastcs-eiger ioc {{ .Values.pvPrefix }} --ip {{ .Values.detectorIp }} --port 80 --odin-ip {{ .Values.detectorName }}-odin-server --odin-port 8888'
