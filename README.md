# Kadras Packages

![Release Workflow](https://github.com/kadras-io/kadras-packages/actions/workflows/release.yml/badge.svg)
[![The SLSA Level 3 badge](https://slsa.dev/images/gh-badge-level3.svg)](https://slsa.dev/spec/v0.1/levels)
[![The Apache 2.0 license badge](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Follow us on Twitter](https://img.shields.io/static/v1?label=Twitter&message=Follow&color=1DA1F2)](https://twitter.com/kadrasIO)

The [Kadras](https://kadras.io) collection of Kubernetes-native packages built with [Carvel](https://carvel.dev).

## 📦&nbsp; Package Repository

This repository contains the following Carvel packages.

| Package | Description |
|---------|-------------|
| [argo-cd](https://github.com/kadras-io/package-for-argo-cd) | A declarative and GitOps continuous delivery tool for Kubernetes. |
| [buildpacks-catalog](https://github.com/kadras-io/buildpacks-catalog) | A curated set of buildpacks, stacks, and builders to use with kpack, a Kubernetes-native implementation of Cloud Native Buildpacks. |
| [cartographer](https://github.com/vmware-tanzu/package-for-cartographer) | A framework to build paved paths to production using your favourite cloud-native tools. Maintained by [VMware Tanzu](https://github.com/vmware-tanzu). |
| [cartographer-blueprints](https://github.com/kadras-io/cartographer-blueprints) | Cartographer reusable blueprints to build Kubernetes-native paved paths to production. |
| [cartographer-delivery](https://github.com/kadras-io/cartographer-delivery) | Cartographer delivery chains to deploy workloads to a Kubernetes cluster based on GitOps or RegistryOps. |
| [cartographer-supply-chains](https://github.com/kadras-io/cartographer-supply-chains) | Cartographer supply chains to build golden paths to production for applications and functions, from source code to delivery in a Kubernetes cluster. |
| [cert-manager](https://github.com/kadras-io/package-for-cert-manager) | A cloud-native solution to automatically provision and manage X.509 certificates. |
| [contour](https://github.com/kadras-io/package-for-contour) | An Envoy-based ingress controller that supports dynamic configuration updates and multi-team ingress delegation. |
| [engineering-platform](https://github.com/kadras-io/engineering-platform) | A curated set of Carvel packages to build an engineering platform supporting application developers with paved paths to production on Kubernetes. |
| [fluxcd-source-controller](https://github.com/kadras-io/package-for-fluxcd-source-controller) | A source management component from the Flux GitOps Toolkit to provide a common interface for artifacts acquisition. |
| [knative-eventing](https://github.com/kadras-io/package-for-knative-eventing) | A solution for routing events from event producers to sinks, enabling developers to use an event-driven architecture with their applications. |
| [knative-serving](https://github.com/kadras-io/package-for-knative-serving) | A solution built on Kubernetes to support deploying and serving of applications and functions as serverless containers. |
| [kpack](https://github.com/kadras-io/package-for-kpack) | A Kubernetes-native implementation of Cloud Native Buildpacks to build source code into OCI images from within your cluster. |
| [metrics-server](https://github.com/kadras-io/package-for-metrics-server) | A scalable and efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines. |
| [secretgen-controller](https://github.com/carvel-dev/secretgen-controller) | Generates various types of Secrets in-cluster as well as export and import Secrets across namespaces. Maintained by [Carvel](https://github.com/carvel-dev). |
| [spring-boot-conventions](https://github.com/kadras-io/package-for-spring-boot-conventions) | Defines conventions for Spring Boot workloads that will be applied by the Cartographer Convention Controller. |
| [tekton-catalog](https://github.com/kadras-io/tekton-catalog) | A set of Tekton pipelines and tasks used by the Kadras platform to support testing, scanning, delivering and deploying applications. |
| [tekton-pipelines](https://github.com/kadras-io/package-for-tekton-pipelines) | A cloud-native solution for building CI/CD systems. |
| [workspace-provisioner](https://github.com/kadras-io/workspace-provisioner) | Provisions and configures workspaces (namespaces or virtual clusters) to work with the Kadras Engineering Platform. |

## 🚀&nbsp; Getting Started

### Prerequisites

* Kubernetes 1.24+
* Carvel [`kctrl`](https://carvel.dev/kapp-controller/docs/latest/install/#installing-kapp-controller-cli-kctrl) CLI.
* Carvel [kapp-controller](https://carvel.dev/kapp-controller) deployed in your Kubernetes cluster. You can install it with Carvel [`kapp`](https://carvel.dev/kapp/docs/latest/install) (recommended choice) or `kubectl`.

  ```shell
  kapp deploy -a kapp-controller -y \
    -f https://github.com/carvel-dev/kapp-controller/releases/latest/download/release.yml
  ```

### Installation

Install the Kadras package repository in a dedicated namespace using `kctrl`:

  ```shell
  kubectl create namespace kadras-packages
  kctrl package repository add -r kadras-repo \
    --url ghcr.io/kadras-io/kadras-packages \
    -n kadras-packages
  ```

<details><summary>Installation via CRDs</summary>
Instead of installing the Kadras package repository with `kctrl`, you can apply the necessary Carvel CRDs directly using [`kapp`](https://carvel.dev/kapp/docs/latest/install), `kubectl` or a GitOps operator.

  ```shell
  kubectl create namespace kadras-packages
  kapp deploy -a kadras-repo -n kadras-packages -y \
    -f https://github.com/kadras-io/kadras-packages/releases/latest/download/package-repository.yml
  ```
</details>

Verify the list of available Carvel package repositories and their status.

  ```shell
  kctrl package repository list -n kadras-packages
  ```

List all the Carvel packages available in the Kadras package repository.

  ```shell
  kctrl package available list -n kadras-packages
  ```

## 📙&nbsp; Documentation

For documentation specific to Carvel package management, check out [carvel.dev](https://carvel.dev/kapp-controller/docs/latest/packaging).

## 🛡️&nbsp; Security

The security process for reporting vulnerabilities is described in [SECURITY.md](SECURITY.md).

## 🖊️&nbsp; License

This project is licensed under the **Apache License 2.0**. See [LICENSE](LICENSE) for more information.

## 🙏&nbsp; Acknowledgments

This package repository is inspired by the one used in the [Tanzu Community Edition](https://github.com/vmware-tanzu/community-edition) project before its retirement.
