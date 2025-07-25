# Odin Helm Charts

A set of helm charts for Odin detector deployments.

## Overview

Their are charts for different odin detectors in the `Charts` directory. These charts
are based depend on `ioc-instance` chart in [ec-helm-charts], which deploys the
fastcs-odin IOC, and add additional templates to instantiate an Odin deployment of
multiple processes for the data capture.

## CI

The `package-helm-charts` CI job will run `helm package ...` on all the charts in the
repo. This can be tested locally by running `./package-helm-charts.sh`.

The generate-schema CI job creates a schema from metadata in the default `values.yaml`
in each chart using [helm-schema]. See the [helm-schema docs][helm-schema-docs] for the
formatting of this metadata. A schema will make instantiating the chart much easier by
enabling auto-complete using the yaml-language-server vscode extension.  This can be
tested locally by running `./generate-schemas.sh`.

## Release Process

Individual charts should be versioned and released separately. For a git tag / GitHub
release of the form `<chart>@<chart-version>`, `<chart>` will be published with version
`<chart-version>` and a schema will be released with version `<chart>@<chart-version>`.
This decoupling of chart releases enables semantic versioning of each chart in isolation
and removes repeated releases of the same chart.

For example, tagging the repo with `odin-eiger@0.2.3` will publish a helm chart `0.2.3`
and a GitHub release and schema `odin-eiger@0.2.3`.  The packaged helm charts are
published to ghcr and can be used as dependencies in `Chart.yaml`

```helm
dependencies:
  - name: odin-eiger
    version: 0.2.3
    repository: "oci://ghcr.io/diamondlightsource"
```

and the generated schema will be available as an asset on the GitHub release at

<https://github.com/DiamondLightSource/odin-helm-charts/releases/download/odin-eiger@0.2.3/odin-eiger.schema.json>

or for the latest release

<https://github.com/DiamondLightSource/odin-helm-charts/releases/latest/download/odin-eiger.schema.json>

[ec-helm-charts]: https://github.com/DiamondLightSource/odin-helm-charts/releases/latest/download/odin-eiger.schema.json
[helm-schema]: https://github.com/dadav/helm-schema
[helm-schema-docs]: https://github.com/dadav/helm-schema?tab=readme-ov-file#examples
