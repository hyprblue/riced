# Hyprblue: Personal Riced Version

[![build-hyprblue](https://github.com/hyprblue/riced/actions/workflows/build.yml/badge.svg)](https://github.com/hyprblue/riced/actions/workflows/build.yml)

This is my personal riced Hyprblue image based on hyprblue/gaming.

Hyprblue is an image that provides the popular [Hyprland](https://hyprland.org/) tiling Wayland compositor along with a collection of applications.

Hyprblue uses [uBlue Starting point](https://github.com/ublue-os/startingpoint) as a basis.
For more info about uBlue, check out the [uBlue homepage](https://ublue.it/).

## Installation

> **Warning**
> This is an experimental feature and should not be used in production, try it in a VM for a while!

To rebase an existing Silverblue/Kinoite installation to the latest build:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/hyprblue/riced:latest
```

This repository builds date tags as well, so if you want to rebase to a particular day's build:

```
sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/hyprblue/riced:20230403
```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/hyprblue/riced

If you're forking this repo, the uBlue website has [instructions](https://ublue.it/making-your-own/) for setting up signing properly.
