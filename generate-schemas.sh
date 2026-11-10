#!/bin/env bash

set -xeuo pipefail

# Install the helm-schema plugin if it is not already present.
# Helm cannot verify plugins installed from a Git repository URL,
# so use --verify=false for the GitHub source.
if ! helm plugin list | grep -q '^schema'; then
    helm plugin install \
        https://github.com/dadav/helm-schema \
        --version 0.23.4 \
        --verify=false
fi

helm schema -v
mkdir -p schemas

for chart in Charts/*; do (
    helm schema -c $chart -o ../../schemas/$(basename $chart).schema.json
); done
