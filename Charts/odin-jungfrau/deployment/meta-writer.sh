#!/bin/bash

{{- $endpoints := list }}
{{- range $i := until (int .Values.odinDataCount) }}
  {{- $endpoints = append $endpoints (printf "tcp://%s-odin-data-%d:10008" $.Values.detectorName $i) }}
{{- end }}

/venv/bin/jungfrau_meta_writer \
    --writer jungfrau_detector.JungfrauMetaWriter \
    --sensor-shape 512 1024 \
    --data-endpoints {{ join "," $endpoints }}
