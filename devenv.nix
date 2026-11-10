{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    # Carvel
    pkgs.imgpkg
    pkgs.kapp
    pkgs.kbld
    pkgs.vendir
    pkgs.ytt

    # Kubernetes
    pkgs.k3d
    pkgs.kind
    pkgs.kubeconform
    pkgs.kubectl
    pkgs.kubernetes-helm

    # Testing
    pkgs.kuttl
    pkgs.kyverno-chainsaw

    # Utilities
    pkgs.cosign
    pkgs.go-task
    pkgs.jq
    pkgs.podman
    pkgs.yamllint
    pkgs.yq-go
  ];

  # https://devenv.sh/languages/
  languages.go.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
