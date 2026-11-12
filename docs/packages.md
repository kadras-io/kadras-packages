# Packages

The Kadras package repository is a Carvel `PackageRepository` bundling the `Package` and `PackageMetadata` resources of all the Kadras packages. Once the repository is added to a cluster, kapp-controller makes its packages available for installation in the same namespace.

## Package versions

Each package is named after the component it installs, with the `packages.kadras.io` suffix, like `cert-manager.packages.kadras.io`.

The packages that install an upstream project follow its version, with a `+kadras.<n>` build suffix identifying the revision of the Kadras packaging, like `1.21.3+kadras.1`. The packages developed by Kadras, like `gitops-configurer` or `engineering-platform`, use their own version.

List the packages available in the repository:

```shell
kctrl package available list -n kadras-system
```

List the versions available for a package:

```shell
kctrl package available list -p cert-manager.packages.kadras.io -n kadras-system
```

## Configuration

Each package can be customized via a `values.yml` file. The configurable properties are documented in the README of each package, linked from the [package list](../README.md), and can also be retrieved from the cluster:

```shell
kctrl package available get -p cert-manager.packages.kadras.io/${VERSION} --values-schema -n kadras-system
```

Reference the `values.yml` file when installing or upgrading the package:

```shell
kctrl package install -i cert-manager \
  -p cert-manager.packages.kadras.io \
  -v ${VERSION} \
  -n kadras-system \
  --values-file values.yml
```

## Engineering Platform

The [engineering-platform](https://github.com/kadras-io/kadras-engineering-platform) package installs a curated set of the packages in the repository, configured to work together. It's the recommended way of installing the packages as a whole, rather than one by one.
