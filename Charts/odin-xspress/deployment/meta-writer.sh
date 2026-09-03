#!/bin/bash

{{- $endpoints := list }}
{{- range $i := until (int .Values.odinDataCount) }}
  {{- $endpoints = append $endpoints (printf "tcp://%s-odin-data-%d:10008" $.Values.detectorName $i) }}
{{- end }}

/venv/bin/xspress_meta_writer \
    --writer xspress_detector.data.xspress_meta_writer.XspressMetaWriter \
    --sensor-shape {{ .Values.numChannels }} 4096 \
    --data-endpoints {{ join "," $endpoints }}
