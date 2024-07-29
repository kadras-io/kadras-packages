# Verifying the Package Repository Release

This package repository is published as an OCI artifact, signed with Sigstore [Cosign](https://docs.sigstore.dev/cosign/overview), and associated with a [SLSA Provenance](https://slsa.dev/provenance) attestation.

Using `cosign`, you can display the supply chain security related artifacts for the `ghcr.io/kadras-io/kadras-packages` images. Use the specific digest you'd like to verify.

```shell
cosign tree ghcr.io/kadras-io/kadras-packages
```

The result:

```shell
📦 Supply Chain Security Related artifacts for an image: ghcr.io/kadras-io/kadras-packages
└── 💾 Attestations for an image tag: ghcr.io/kadras-io/kadras-packages:sha256-3b5321df10e6b30cd30b4dc8b8c8f0f4b3ccd9605eb9d25af03108d6e148012c.att
   └── 🍒 sha256:8e6fc2f6005fb56c588700579cbeecabce064cf604b3cabe6294154cfe69b919
└── 🔐 Signatures for an image tag: ghcr.io/kadras-io/kadras-packages:sha256-3b5321df10e6b30cd30b4dc8b8c8f0f4b3ccd9605eb9d25af03108d6e148012c.sig
   └── 🍒 sha256:74c7b24859642cce47b205f0c9be06164b4d182a2c73d1c435dc4ad7af924691
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
