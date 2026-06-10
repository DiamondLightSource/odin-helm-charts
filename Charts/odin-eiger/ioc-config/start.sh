#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
stdio-expose --ptty --stdin --ctrl-d 'python -Xfrozen_modules=off -m debugpy --listen 0.0.0.0:5678 --wait-for-client -m fastcs-eiger ioc {{ .Values.pvPrefix }} --ip {{ .Values.detectorIp }} --port 80 --odin-ip {{ .Values.detectorName }}-odin-server --odin-port 8888'