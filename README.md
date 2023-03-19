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
| [application-platform](https://github.com/kadras-io/kadras-application-platform) | A curated set of Carvel packages to build an engineering platform supporting application developers with paved paths to production on Kubernetes. |
| [argo-cd](https://github.com/kadras-io/package-for-argo-cd) | A declarative and GitOps continuous delivery tool for Kubernetes. |
| [cartographer](https://github.com/vmware-tanzu/package-for-cartographer) | A framework to build paved paths to production using your favourite cloud-native tools. Maintained by [VMware Tanzu](https://github.com/vmware-tanzu). |
| [cartographer-blueprints](https://github.com/kadras-io/cartographer-blueprints) | A curated set of reusable blueprints for Cartographer, a Kubernetes-native framework to build paved paths to production. |
| [cartographer-delivery](https://github.com/kadras-io/cartographer-delivery) | A curated set of Cartographer delivery chains to deploy workloads to Kubernetes based on GitOps or RegistryOps. |
| [cartographer-supply-chains](https://github.com/kadras-io/cartographer-supply-chains) | A curated set of Cartographer supply chains to build golden paths to production for applications and functions, from source code to delivery in a Kubernetes cluster. |
| [cert-manager](https://github.com/kadras-io/package-for-cert-manager) | A cloud-native solution to automatically provision and manage X.509 certificates in Kubernetes. |
| [contour](https://github.com/kadras-io/package-for-contour) | An Envoy-based ingress controller that supports dynamic configuration updates and multi-team ingress delegation. |
| [fluxcd-source-controller](https://github.com/kadras-io/package-for-fluxcd-source-controller) | A source management component from the Flux GitOps Toolkit to provide a common interface for artifacts acquisition. |
| [knative-eventing](https://github.com/kadras-io/package-for-knative-eventing) | A solution for routing events from event producers to sinks, enabling developers to use an event-driven architecture with their applications. |
| [knative-serving](https://github.com/kadras-io/package-for-knative-serving) | A solution built on Kubernetes to support deploying and serving of applications and functions as serverless containers. |
| [kpack](https://github.com/kadras-io/package-for-kpack) | Kubernetes-native container build service based on Cloud Native Buildpacks. |
| [kpack-dependencies](https://github.com/kadras-io/kpack-dependencies) | A set of buildpacks, stacks, and builders to use with kpack. |
| [metrics-server](https://github.com/kadras-io/package-for-metrics-server) | A scalable and efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines. |
| [namespace-setup](https://github.com/kadras-io/namespace-setup) | Sets up up namespaces with the necessary RBAC and Secrets to work with the Kadras platform. |
| [secretgen-controller](https://github.com/vmware-tanzu/carvel-secretgen-controller) | Generates various types of Secrets in-cluster as well as export and import Secrets across namespaces. Maintained by [VMware Tanzu](https://github.com/vmware-tanzu). |
| [spring-boot-conventions](https://github.com/kadras-io/package-for-spring-boot-conventions) | Defines conventions for Spring Boot workloads that will be applied by the Cartographer Convention Controller. |
| [tekton-pipelines](https://github.com/kadras-io/package-for-tekton-pipelines) | A cloud-native solution for building CI/CD systems. |

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
