#!/bin/bash

{{- $endpointFormat := (printf "tcp://%s-odin-data-%%d:%d" .Values.detectorName 10008) }}

/venv/bin/eiger_meta_writer \
    --writer eiger_detector.EigerMetaWriter \
    --sensor-shape {{ .Values.sensorSizeY }} {{ .Values.sensorSizeX }} \
    --data-endpoints {{ include "odin-helm-charts.rangeJoin" (dict "separator" "," "format" $endpointFormat "count" .Values.odinDataCount ) }}
