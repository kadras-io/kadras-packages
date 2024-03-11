# Kadras Packages

![Release Workflow](https://github.com/kadras-io/kadras-packages/actions/workflows/release.yml/badge.svg)
[![The SLSA Level 3 badge](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev/spec/v1.0/levels)
[![The Apache 2.0 license badge](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Follow us on Twitter](https://img.shields.io/static/v1?label=Twitter&message=Follow&color=1DA1F2)](https://twitter.com/kadrasIO)

The [Kadras](https://kadras.io) collection of Kubernetes-native packages built with [Carvel](https://carvel.dev).

## 📦&nbsp; Package Repository

This repository contains the following Carvel packages.

| Package | Description |
|---------|-------------|
| [buildpacks-catalog](https://github.com/kadras-io/buildpacks-catalog) | A curated set of buildpacks, stacks, and builders to use with kpack, a Kubernetes-native implementation of Cloud Native Buildpacks. |
| [cert-manager](https://github.com/kadras-io/package-for-cert-manager) | A cloud-native solution to automatically provision and manage X.509 certificates. |
| [cert-manager-issuers](https://github.com/kadras-io/cert-manager-issuers) | A collection of issuers for Cert Manager, used by the Kadras platform to support TLS via a private CA or Let's Encrypt. |
| [contour](https://github.com/kadras-io/package-for-contour) | An Envoy-based ingress controller that supports dynamic configuration updates and multi-team ingress delegation. |
| [crossplane](https://github.com/kadras-io/package-for-crossplane) | A Kubernetes extension that transforms your Kubernetes cluster into a universal control plane. |
| [dapr](https://github.com/kadras-io/package-for-dapr) | A Kubernetes extension that provides integrated APIs for communication, state, and workflow. |
| [developer-portal](https://github.com/kadras-io/package-for-developer-portal) | Kadras Developer Portal, based on Backstage. It supports application developers with paved paths to production on Kubernetes. |
| [engineering-platform](https://github.com/kadras-io/engineering-platform) | A curated set of Carvel packages to build an engineering platform supporting application developers with paved paths to production on Kubernetes. |
| [flux](https://github.com/kadras-io/package-for-flux) | A continuous deployment solution for Kubernetes, powered by the GitOps Toolkit. |
| [gitops-configurer](https://github.com/kadras-io/gitops-configurer) | Provides GitOps configuration for the Kadras Engineering Platform. |
| [knative-serving](https://github.com/kadras-io/package-for-knative-serving) | A solution built on Kubernetes to support deploying and serving of applications and functions as serverless containers. |
| [kpack](https://github.com/kadras-io/package-for-kpack) | A Kubernetes-native implementation of Cloud Native Buildpacks to build source code into OCI images from within your cluster. |
| [kyverno](https://github.com/kadras-io/package-for-kyverno) | A policy engine designed for Kubernetes. It can validate, mutate, and generate configurations using admission controls and background scans. |
| [metrics-server](https://github.com/kadras-io/package-for-metrics-server) | A scalable and efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines. |
| [rabbitmq-operator](https://github.com/kadras-io/package-for-rabbitmq-operator) | A message broker supporting multiple messaging protocols and streaming. |
| [rbac-configurer](https://github.com/kadras-io/rbac-configurer) | Provides default roles and RBAC configuration for the Kadras Engineering Platform. |
| [secretgen-controller](https://github.com/kadras-io/package-for-secretgen-controller) | Generates various types of Secrets in-cluster as well as export and import Secrets across namespaces. |
| [service-binding](https://github.com/kadras-io/package-for-service-binding) | A standard and automated way for communicating service secrets to workloads. |
| [tekton-pipelines](https://github.com/kadras-io/package-for-tekton-pipelines) | A cloud-native solution for building CI/CD systems. |
| [weaviate](https://github.com/kadras-io/package-for-weaviate) | An AI-native vector database that helps developers create intuitive and reliable AI-powered applications. |
| [workspace-provisioner](https://github.com/kadras-io/workspace-provisioner) | Provisions and configures workspaces (namespaces or virtual clusters) to work with the Kadras Engineering Platform. |

## 🚀&nbsp; Getting Started

### Prerequisites

* Kubernetes 1.27+
* Carvel [`kctrl`](https://carvel.dev/kapp-controller/docs/latest/install/#installing-kapp-controller-cli-kctrl) CLI.
* Carvel [kapp-controller](https://carvel.dev/kapp-controller) deployed in your Kubernetes cluster. You can install it with Carvel [`kapp`](https://carvel.dev/kapp/docs/latest/install) (recommended choice) or `kubectl`.

  ```shell
  kapp deploy -a kapp-controller -y \
    -f https://github.com/carvel-dev/kapp-controller/releases/latest/download/release.yml
  ```

### Installation

Install the Kadras package repository in a dedicated namespace using `kctrl`:

  ```shell
  kctrl package repository add -r kadras-packages \
    --url ghcr.io/kadras-io/kadras-packages \
    -n kadras-system --create-namespace
  ```

<details><summary>Installation via CRDs</summary>
Instead of installing the Kadras package repository with `kctrl`, you can apply the necessary Carvel CRDs directly using [`kapp`](https://carvel.dev/kapp/docs/latest/install), `kubectl` or a GitOps operator.

  ```shell
  kubectl create namespace kadras-system
  kapp deploy -a kadras-repo -n kadras-system -y \
    -f https://github.com/kadras-io/kadras-packages/releases/latest/download/package-repository.yml
  ```
</details>

Verify the list of available Carvel package repositories and their status.

  ```shell
  kctrl package repository list -n kadras-system
  ```

List all the Carvel packages available in the Kadras package repository.

  ```shell
  kctrl package available list -n kadras-system
  ```

## 📙&nbsp; Documentation

For documentation specific to Carvel package management, check out [carvel.dev](https://carvel.dev/kapp-controller/docs/latest/packaging).

## 🛡️&nbsp; Security

The security process for reporting vulnerabilities is described in [SECURITY.md](SECURITY.md).

## 🖊️&nbsp; License

This project is licensed under the **Apache License 2.0**. See [LICENSE](LICENSE) for more information.
