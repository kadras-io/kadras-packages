# Verifying the Package Repository Release

This package repository is published as an OCI artifact, signed with Sigstore [Cosign](https://docs.sigstore.dev/cosign/overview), and associated with a [SLSA Provenance](https://slsa.dev/provenance) attestation.

Using `cosign`, you can display the supply chain security related artifacts for the `ghcr.io/kadras-io/kadras-packages` images. Use the specific digest you'd like to verify.

```shell
cosign tree ghcr.io/kadras-io/kadras-packages
```

The result:

```shell
📦 Supply Chain Security Related artifacts for an image: ghcr.io/kadras-io/kadras-packages
└── 💾 Attestations for an image tag: ghcr.io/kadras-io/kadras-packages:sha256-046c6f16def6fa8ea562c84169725a4a7ef8c16dd7180137dc729f555af4a151.att
   └── 🍒 sha256:23f10f5d24941657ddaa5ff25117373a243abbeb51f2f81065e562e3b292ee2d
└── 🔐 Signatures for an image tag: ghcr.io/kadras-io/kadras-packages:sha256-046c6f16def6fa8ea562c84169725a4a7ef8c16dd7180137dc729f555af4a151.sig
   └── 🍒 sha256:2e765ddc539ac475fa5275d0709e62699ebc2b47d054be5d5eb05b3d958310e6
```

You can verify the signature and its claims:

```shell
cosign verify \
   --certificate-identity-regexp https://github.com/kadras-io \
   --certificate-oidc-issuer https://token.actions.githubusercontent.com \
   ghcr.io/kadras-io/kadras-packages | jq
```

You can also verify the SLSA Provenance attestation associated with the image.

```shell
cosign verify-attestation --type slsaprovenance \
   --certificate-identity-regexp https://github.com/slsa-framework \
   --certificate-oidc-issuer https://token.actions.githubusercontent.com \
   ghcr.io/kadras-io/kadras-packages | jq .payload -r | base64 --decode | jq
```
