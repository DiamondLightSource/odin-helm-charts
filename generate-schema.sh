#!/bin/env bash

set -xeuo pipefail

HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

helm schema -v || helm install https://github.com/dadav/helm-schema

mkdir -p schema

for chart in Charts/*; do (
    helm schema -c $chart -o ../../schema/$(basename $chart).schema.json
); done
