#!/bin/bash

{{- $endpoints := list }}
{{- range $i := until (int .Values.odinDataCount) }}
  {{- $endpoints = append $endpoints (printf "tcp://%s-odin-data-%d:15500" $.Values.detectorName $i) }}
{{- end }}

/venv/bin/xspress_live_merge --sub_ports {{ join "," $endpoints }}
