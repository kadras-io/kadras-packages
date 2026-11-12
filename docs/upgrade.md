# Upgrading

The `kctrl package repository add` command in the [README](../README.md#installation) references the `latest` tag of the repository. kapp-controller fetches it again periodically, so new package versions become available on the cluster without further action. Installed packages are not upgraded automatically.

To control when new package versions become available, reference a specific release of the repository instead. The releases are listed on [GitHub](https://github.com/kadras-io/kadras-packages/releases).

```shell
kctrl package repository update -r kadras-packages \
  --url ghcr.io/kadras-io/kadras-packages:${VERSION} \
  -n kadras-system
```

Then upgrade each installed package to one of the versions now available, with the same values file.

```shell
kctrl package installed update -i cert-manager -v ${VERSION} -n kadras-system --values-file values.yml
```

## Uninstalling

```shell
kctrl package repository delete -r kadras-packages -n kadras-system
```

> **Warning**
> Deleting the repository doesn't uninstall the packages installed from it, but they can't be reconciled or upgraded until the repository is added again. Uninstall the packages first if you don't need them anymore.

```shell
kctrl package installed delete -i cert-manager -n kadras-system
```
