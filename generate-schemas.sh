#!/bin/env bash

set -xeuo pipefail

helm schema -v || helm plugin install https://github.com/dadav/helm-schema --version 0.23.4

mkdir -p schemas

for chart in Charts/*; do (
    helm schema -c $chart -o ../../schemas/$(basename $chart).schema.json
); done
