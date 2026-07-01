#!/bin/bash

{{- $endpoints := list }}
{{- range $i := until (int .Values.odinDataCount) }}
  {{- $endpoints = append $endpoints (printf "tcp://%s-odin-data-%d:10008" $.Values.detectorName $i) }}
{{- end }}

/venv/bin/meta_writer \
    --sensor-shape {{ .Values.sensorSizeY }} {{ .Values.sensorSizeX }} \
    --data-endpoints {{ join "," $endpoints }}
