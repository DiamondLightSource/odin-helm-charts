#!/bin/bash

{{- $endpoints := list }}
{{- range $i := until (int .Values.odinDataCount) }}
  {{- $endpoints = append $endpoints (printf "tcp://%s-odin-data-%d:10008" $.Values.detectorName $i) }}
{{- end }}

/venv/bin/eiger_meta_writer \
    --writer eiger_detector.EigerMetaWriter \
    --sensor-shape {{ .Values.sensorSizeY }} {{ .Values.sensorSizeX }} \
    --data-endpoints {{ join "," $endpoints }}
