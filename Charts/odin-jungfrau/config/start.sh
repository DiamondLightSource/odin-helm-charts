#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
fastcs-jungfrau ioc {{ .Values.pvPrefix }} --config {{ .Values.configFilePath }}
