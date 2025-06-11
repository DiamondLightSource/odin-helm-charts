#!/bin/bash

/venv/bin/eiger_meta_writer -w eiger_detector.EigerMetaWriter --sensor-shape {{ .Values.sensorSizeX }} {{ .Values.sensorSizeY }} --data-endpoints {{ $sep := "" }}{{- range $idx, $e := until (int $.Values.odinDataCount) }}{{ $sep }}tcp://{{ $.Values.detectorName }}-odin-data-{{ $idx }}:10008{{ $sep = "," }}{{- end }}
