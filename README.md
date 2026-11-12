# Kadras Packages

![Release Workflow](https://github.com/kadras-io/kadras-packages/actions/workflows/release.yml/badge.svg)
[![The SLSA Level 3 badge](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev/spec/v1.0/levels)
[![The Apache 2.0 license badge](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Follow us on Bluesky](https://img.shields.io/static/v1?label=Bluesky&message=Follow&color=1DA1F2)](https://bsky.app/profile/kadras.bsky.social)

The [Kadras](https://kadras.io) collection of Kubernetes-native packages built with [Carvel](https://carvel.dev). It's published as a Carvel package repository, making all the Kadras packages available for installation on a cluster with kapp-controller.

## ✨&nbsp; What's Included

* **Carvel packages**. Each package installs a cloud-native project or a Kadras component, on its own or as part of the [engineering platform](https://github.com/kadras-io/kadras-engineering-platform).
* **Signed releases**. The repository is published as an OCI artifact, signed with Cosign and with a SLSA Provenance attestation.

## 📦&nbsp; Package Repository

This repository contains the following Carvel packages.

| Package | Description |
|---------|-------------|
| [cert-manager](https://github.com/kadras-io/package-for-cert-manager) | A cloud-native solution to automatically provision and manage X.509 certificates. |
| [cert-manager-webhook-hetzner](https://github.com/kadras-io/package-for-cert-manager-webhook-hetzner) | A webhook that creates the necessary DNS entries in the Hetzner DNS API to solve a DNS01 challenge for a cert-manager Issuer of the ACME type. |
| [crossplane](https://github.com/kadras-io/package-for-crossplane) | A Kubernetes extension that transforms your Kubernetes cluster into a universal control plane. |
| [dependency-track](https://github.com/kadras-io/package-for-dependency-track) | OWASP Dependency Track is a continuous SBOM Analysis Platform for managing software supply chain security risks. |
| [developer-portal](https://github.com/kadras-io/package-for-developer-portal) | Kadras Developer Portal, based on Backstage. It supports application developers with paved paths to production on Kubernetes. |
| [engineering-platform](https://github.com/kadras-io/kadras-engineering-platform) | A curated set of Carvel packages to build an engineering platform supporting application developers with paved paths to production on Kubernetes. |
| [envoy-gateway](https://github.com/kadras-io/package-for-envoy-gateway) | An application gateway that manages Envoy proxies, configured via the Kubernetes Gateway API. |
| [flagger](https://github.com/kadras-io/package-for-flagger) | A progressive delivery tool that automates the release process for applications running on Kubernetes. |
| [flux](https://github.com/kadras-io/package-for-flux) | A continuous deployment solution for Kubernetes, powered by the GitOps Toolkit. |
| [gateway-api](https://github.com/kadras-io/package-for-gateway-api) | The CustomResourceDefinitions of the Kubernetes Gateway API, the API to expose and route traffic to applications on Kubernetes. |
| [gitops-configurer](https://github.com/kadras-io/gitops-configurer) | Onboards a cluster to GitOps, keeping it in sync with the manifests in a Git repository or OCI artifact via Flux. |
| [knative-serving](https://github.com/kadras-io/package-for-knative-serving) | A solution built on Kubernetes to support deploying and serving of applications and functions as serverless containers. |
| [kyverno](https://github.com/kadras-io/package-for-kyverno) | A policy engine designed for Kubernetes. It can validate, mutate, and generate configurations using admission controls and background scans. |
| [metrics-server](https://github.com/kadras-io/package-for-metrics-server) | A scalable and efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines. |
| [opentelemetry-operator](https://github.com/kadras-io/package-for-opentelemetry-operator) | An operator that manages collectors and auto-instrumentation of the workload using OpenTelemetry instrumentation libraries. |
| [postgresql-operator](https://github.com/kadras-io/package-for-postgresql-operator) | CloudNativePG, a Kubernetes operator that covers the full lifecycle of a PostgreSQL database cluster with a primary/standby architecture, using native streaming replication. |
| [rabbitmq-operator](https://github.com/kadras-io/package-for-rabbitmq-operator) | A message broker supporting multiple messaging protocols and streaming. |
| [secretgen-controller](https://github.com/kadras-io/package-for-secretgen-controller) | Generates various types of Secrets in-cluster as well as export and import Secrets across namespaces. |
| [workspace-provisioner](https://github.com/kadras-io/workspace-provisioner) | Provisions and configures workspaces (namespaces or virtual clusters) to work with the Kadras Engineering Platform. |

## 🚀&nbsp; Getting Started

### Prerequisites

* Kubernetes 1.35+
* Carvel [`kctrl`](https://carvel.dev/kapp-controller/docs/latest/install/#installing-kapp-controller-cli-kctrl) CLI.
* Carvel [kapp-controller](https://carvel.dev/kapp-controller) deployed in your Kubernetes cluster. You can install it with Carvel [`kapp`](https://carvel.dev/kapp/docs/latest/install) (recommended choice) or `kubectl`.

```shell
kapp deploy -a kapp-controller -y \
  -f https://github.com/carvel-dev/kapp-controller/releases/latest/download/release.yml
```

### Installation

Add the Kadras package repository to your Kubernetes cluster, in a dedicated namespace:

```shell
kctrl package repository add -r kadras-packages \
  --url ghcr.io/kadras-io/kadras-packages \
  -n kadras-system --create-namespace
```

<details><summary>Installation without kctrl</summary>
Instead of adding the Kadras package repository with <code>kctrl</code>, you can apply the <code>PackageRepository</code> resource directly using <a href="https://carvel.dev/kapp/docs/latest/install"><code>kapp</code></a>, <code>kubectl</code>, or a GitOps tool.

```shell
kubectl create namespace kadras-system
kapp deploy -a kadras-repo -n kadras-system -y \
  -f https://github.com/kadras-io/kadras-packages/releases/latest/download/package-repository.yml
```
</details>

Verify the package repository and its status:

```shell
kctrl package repository list -n kadras-system
```

List all the packages available in the Kadras package repository:

```shell
kctrl package available list -n kadras-system
```

### Try It Out

Install the cert-manager package from the repository:

```shell
kctrl package install -i cert-manager \
  -p cert-manager.packages.kadras.io \
  -v ${VERSION} \
  -n kadras-system
```

> **Note**
> You can find the `${VERSION}` value by retrieving the list of package versions available in the Kadras package repository installed on your cluster.
> 
> ```shell
> kctrl package available list -p cert-manager.packages.kadras.io -n kadras-system
> ```

Verify the installed packages and their status:

```shell
kctrl package installed list -n kadras-system
```

## 📙&nbsp; Documentation

Documentation, tutorials and examples for this package repository are available in the [docs](docs) folder.
For documentation specific to Carvel package management, check out [carvel.dev](https://carvel.dev/kapp-controller/docs/latest/packaging).

* [Package versions and configuration](docs/packages.md)
* [Upgrading and uninstalling](docs/upgrade.md)
* [Verifying the release](docs/verify-release.md)

## 🛠️&nbsp; Development

The development environment is defined with [devenv](https://devenv.sh). Enter it with `devenv shell`, or automatically with [direnv](https://direnv.net) after running `direnv allow`.

The `Package` and `PackageMetadata` resources are stored in the [repo/packages](repo/packages) folder, one subfolder per package. The repository is released via the [Release](.github/workflows/release.yml) workflow, which bundles them with `kctrl package repo release`, publishes the result to `ghcr.io/kadras-io/kadras-packages`, and signs it.

## 🛡️&nbsp; Security

The security process for reporting vulnerabilities is described in [SECURITY.md](SECURITY.md).

## 🖊️&nbsp; License

This project is licensed under the **Apache License 2.0**. See [LICENSE](LICENSE) for more information.
