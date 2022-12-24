# Kadras Packages

<a href="https://slsa.dev/spec/v0.1/levels"><img src="https://slsa.dev/images/gh-badge-level3.svg" alt="The SLSA Level 3 badge"></a>

A collection of Kubernetes-native packages built with [Carvel](https://carvel.dev) and part of the Kadras project.

## Package Repository

This repository contains the following Carvel packages part of the [Kadras](https://kadras.io) project.

| Package | Description |
|---------|-------------|
| [application-platform](https://github.com/arktonix/kadras-application-platform) | A curated collection of packages to build an application platform or internal developer platform (IDP) on Kubernetes. |
| [argo-cd](https://github.com/arktonix/package-for-argo-cd) | A declarative and GitOps continuous delivery tool for Kubernetes. |
| [cartographer](https://github.com/vmware-tanzu/package-for-cartographer) | A framework to build paved paths to production using your favourite cloud-native tools. Maintained by [VMware Tanzu](https://github.com/vmware-tanzu). |
| [cartographer-blueprints](https://github.com/arktonix/cartographer-blueprints) | A curated set of reusable blueprints for Cartographer, a Kubernetes-native framework to build paved paths to production. |
| [cartographer-delivery](https://github.com/arktonix/cartographer-delivery) | A curated set of Cartographer delivery chains to deploy workloads to Kubernetes based on GitOps or RegistryOps. |
| [cartographer-supply-chains](https://github.com/arktonix/cartographer-supply-chains) | A curated set of Cartographer supply chains to build golden paths to production for applications and functions, from source code to delivery in a Kubernetes cluster. |
| [cert-manager](https://github.com/arktonix/package-for-cert-manager) | Cloud-native solution to automatically provision and manage TLS certificates in Kubernetes. |
| [contour](https://github.com/arktonix/package-for-contour) | An Envoy-based ingress controller that supports dynamic configuration updates and multi-team ingress delegation. |
| [fluxcd-source-controller](https://github.com/arktonix/package-for-fluxcd-source-controller) | A source management component from the Flux GitOps Toolkit to provide a common interface for artifacts acquisition. |
| [knative-eventing](https://github.com/arktonix/package-for-knative-eventing) | A solution for routing events from event producers to sinks, enabling developers to use an event-driven architecture with their applications. |
| [knative-serving](https://github.com/arktonix/package-for-knative-serving) | A solution built on Kubernetes to support deploying and serving of applications and functions as serverless containers. |
| [kpack](https://github.com/arktonix/package-for-kpack) | Kubernetes-native container build service based on Cloud Native Buildpacks. |
| [kpack-dependencies](https://github.com/arktonix/kpack-dependencies) | A set of buildpacks, stacks, and builders to use with kpack. |
| [metrics-server](https://github.com/arktonix/package-for-metrics-server) | A scalable and efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines. |
| [namespace-setup](https://github.com/arktonix/namespace-setup) | Sets up up namespaces with the necessary RBAC and Secrets to work with the Kadras platform. |
| [secretgen-controller](https://github.com/vmware-tanzu/carvel-secretgen-controller) | Generates various types of Secrets in-cluster as well as export and import Secrets across namespaces. Maintained by [VMware Tanzu](https://github.com/vmware-tanzu). |
| [spring-boot-conventions](https://github.com/arktonix/package-for-spring-boot-conventions) | Defines conventions for Spring Boot workloads that will be applied by the Cartographer Convention Controller. |
| [tekton-pipelines](https://github.com/arktonix/package-for-tekton-pipelines) | A cloud-native solution for building CI/CD systems. |

## Prerequisites

* Kubernetes 1.24+
* Carvel [`kctrl`](https://carvel.dev/kapp-controller/docs/latest/install/#installing-kapp-controller-cli-kctrl) CLI.
* Carvel [kapp-controller](https://carvel.dev/kapp-controller) deployed in your Kubernetes cluster. You can install it with Carvel [`kapp`](https://carvel.dev/kapp/docs/latest/install) (recommended choice) or `kubectl`.

  ```shell
  kapp deploy -a kapp-controller -y \
    -f https://github.com/vmware-tanzu/carvel-kapp-controller/releases/latest/download/release.yml
  ```

## Installation

You can install the Kadras package repository in a dedicated namespace using `kctrl`:

    ```shell
    kubectl create namespace kadras-packages
    kctrl package repository add -r kadras-repo \
        --url ghcr.io/arktonix/kadras-packages:0.7.0 \
        -n kadras-packages
    ```

### Verification

You can verify the list of available Carvel package repositories and their status.

  ```shell
  kctrl package repository list -n kadras-packages
  ```

### Packages

The Kadras package repository provides a collection of Carvel packages that you can list.

    ```shell
    kctrl package available list -p kpack.packages.kadras.io -n kadras-packages
    ```

## Upgrading

You can upgrade an existing repository to a newer version using `kctrl`.

  ```shell
  kctrl package repository update -r kadras-repo \
    --url ghcr.io/arktonix/kadras-packages:<new-version> \
    -n kadras-packages
  ```

## Other

Instead of installing the Kadras package repository with `kctrl`, you can apply the necessary Carvel `PackageMetadata` and `Package` resources directly using [`kapp`](https://carvel.dev/kapp/docs/latest/install) or `kubectl`.

  ```shell
  kubectl create namespace kadras-packages
  kapp deploy -a kadras-repo -n kadras-packages -y \
    -f https://github.com/arktonix/kadras-packages/releases/latest/download/package-repository.yml
  ```

## Support and Documentation

For support and documentation about Carvel package management, check out [carvel.dev](https://carvel.dev/kapp-controller/docs/latest/packaging).

## References

This package repository is inspired by the work done by the Carvel team and the [Tanzu Community Edition](https://github.com/vmware-tanzu/community-edition) project (now retired). Learn more about [Kubernetes-native package management with Carvel](https://carvel.dev/kapp-controller/docs/latest/packaging).

## Supply Chain Security

This project is compliant with level 3 of the [SLSA Framework](https://slsa.dev).

<img src="https://slsa.dev/images/SLSA-Badge-full-level3.svg" alt="The SLSA Level 3 badge" width=200>
