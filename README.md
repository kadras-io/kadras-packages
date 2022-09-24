# Kadras Packages

A repository of [Carvel](https://carvel.dev) packages that can be installed on Kubernetes.

## Components

This repository contains the Carvel packages part of the Kadras project. The following packages are
maintained by the [Arktonix](https://github.com/arktonix) organization:

* [Argo CD](https://github.com/arktonix/package-for-argo-cd)

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
    --url ghcr.io/arktonix/kadras-packages:0.0.1 \
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

## References and inspiration

* [Kubernetes native package management with Carvel](https://carvel.dev/kapp-controller/docs/latest/packaging)
* [Tanzu Community Edition, an open-source Kubernetes platform](https://tanzucommunityedition.io)
* [An example of package repository for installing the Tanzu Application Platform OSS stack](https://github.com/vrabbi/tap-oss)

## Supply Chain Security

This project is compliant with level 2 of the [SLSA Framework](https://slsa.dev).

<img src="https://slsa.dev/images/SLSA-Badge-full-level2.svg" alt="The SLSA Level 2 badge" width=200>
