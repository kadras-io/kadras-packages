# Kadras Packages

A collection of Kubernetes-native packages based on [Carvel](https://carvel.dev) and part of the Kadras project.

## Components

This repository contains the Carvel packages part of the Kadras project.

The following packages are maintained by the [Arktonix](https://github.com/arktonix) organization:

* [application-platform](https://github.com/arktonix/kadras-application-platform)
* [argo-cd](https://github.com/arktonix/package-for-argo-cd)
* [cartographer-blueprints](https://github.com/arktonix/cartographer-blueprints)
* [cartographer-delivery](https://github.com/arktonix/cartographer-delivery)
* [cartographer-golden-path-web](https://github.com/arktonix/cartographer-golden-path-web)
* [contour](https://github.com/arktonix/package-for-contour)
* [fluxcd-source-controller](https://github.com/arktonix/package-for-fluxcd-source-controller)
* [knative-eventing](https://github.com/arktonix/package-for-knative-eventing)
* [knative-serving](https://github.com/arktonix/package-for-knative-serving)
* [kpack-dependencies](https://github.com/arktonix/kpack-dependencies)
* [metrics-server](https://github.com/arktonix/package-for-metrics-server)
* [namespace-setup](https://github.com/arktonix/namespace-setup)
* [spring-boot-conventions](https://github.com/arktonix/package-for-spring-boot-conventions)
* [tekton-pipelines](https://github.com/arktonix/package-for-tekton-pipelines)

It also includes the following open-source packages maintained by the [VMware Tanzu](https://github.com/vmware-tanzu) organization:

* [cartographer](https://github.com/vmware-tanzu/package-for-cartographer)
* [cert-manager](https://github.com/vmware-tanzu/community-edition/tree/main/addons/packages/cert-manager)
* [kpack](https://github.com/vmware-tanzu/package-for-kpack)
* [secretgen-controller](https://github.com/vmware-tanzu/carvel-secretgen-controller)

## Prerequisites

* Install the [`kctrl`](https://carvel.dev/kapp-controller/docs/latest/install/#installing-kapp-controller-cli-kctrl) CLI to manage Carvel packages in a convenient way.
* Ensure [kapp-controller](https://carvel.dev/kapp-controller) is deployed in your Kubernetes cluster. You can do that with Carvel
[`kapp`](https://carvel.dev/kapp/docs/latest/install) (recommended choice) or `kubectl`.

```shell
kapp deploy -a kapp-controller -y \
  -f https://github.com/vmware-tanzu/carvel-kapp-controller/releases/latest/download/release.yml
```

## Installation

You can install the Kadras package repository in a dedicated namespace using `kctrl`:

```shell
kubectl create namespace carvel-packages
kctrl package repository add -r kadras-repo \
    --url ghcr.io/arktonix/kadras-packages:0.2.3 \
    -n carvel-packages
```

Alternatively, you can add the repository by applying the `PackageRepository` manifest:

```shell
kubectl create namespace carvel-packages
kapp deploy -a kadras-repo -n carvel-packages -y \
    -f https://github.com/arktonix/kadras-packages/releases/latest/download/package-repository.yml
```

After the installation, you can retrieve the list of available Carvel package repositories in your cluster
with the following command.

```shell
kctrl package repository list -n carvel-packages
```

The Kadras package repository provides a collection of Carvel packages that you can list as follows.

```shell
kctrl package available list -n carvel-packages
```

## Update

You can update the repository by applying the `PackageRepository` manifest from the newest release, similar
to the process described in the "Installation" section. Alternatively, you can use the `kctrl` CLI.

```shell
kctrl package repository update -r kadras-repo \
    --url ghcr.io/arktonix/kadras-packages:<new-version> \
    -n carvel-packages
```

## Documentation

You can find more documentation about Carvel package management at [carvel.dev](https://carvel.dev/kapp-controller/docs/latest/packaging).

## References

This package repository is based on and inspired by the work done by the Carvel team and the
Tanzu Community Edition project.

* [Kubernetes native package management with Carvel](https://carvel.dev/kapp-controller/docs/latest/packaging)
* [Tanzu Community Edition, an open-source Kubernetes platform](https://tanzucommunityedition.io)

## Supply Chain Security

This project is compliant with level 2 of the [SLSA Framework](https://slsa.dev).

<img src="https://slsa.dev/images/SLSA-Badge-full-level2.svg" alt="The SLSA Level 2 badge" width=200>
