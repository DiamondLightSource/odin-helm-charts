#!/bin/bash

{{- $endpoints := list }}
{{- range $i := until (int .Values.odinDataCount) }}
  {{- $endpoints = append $endpoints (printf "tcp://%s-odin-data-%d:10008" $.Values.detectorName $i) }}
{{- end }}

/venv/bin/excalibur_meta_writer \
    --writer excalibur_detector.ExcaliburMetaWriter \
    --sensor-shape {{ .Values.sensorSizeY }} {{ .Values.sensorSizeX }} \
    --data-endpoints {{ join "," $endpoints }}
