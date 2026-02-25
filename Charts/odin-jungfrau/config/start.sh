#!/bin/bash

# Wait for odin processes to start
sleep 5

# Start the IOC
fastcs-jungfrau ioc {{ .Values.pvPrefix }} --config /epics/ioc/jungfrau_9m.config --odin-ip {{ .Values.detectorName }}-odin-server --odin-port 8888
