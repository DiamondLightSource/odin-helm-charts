#!/bin/env bash

set -xeuo pipefail

FULL_REF=$(git describe)
VERSION="${FULL_REF#*@}"

mkdir -p charts

for chart in Charts/*; do
(
    cd $(realpath $chart)
    helm package -u --app-version ${VERSION} --version ${VERSION} .
    mv *.tgz ../../charts
)
done
