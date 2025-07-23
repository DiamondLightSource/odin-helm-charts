#!/bin/env bash

set -xeuo pipefail

VERSION=$(git describe)

mkdir -p charts

for chart in Charts/*; do
(
    cd $(realpath $chart)
    helm package -u --app-version ${VERSION} --version ${VERSION} .
    mv *.tgz ../../charts
)
done
