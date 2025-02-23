# tj5-os &nbsp; [![bluebuild build badge](https://github.com/tj5miniop/tj5-os/actions/workflows/build.yml/badge.svg)](https://github.com/tj5miniop/tj5-os/actions/workflows/build.yml)

# TJ5-OS 

This is a project that's been on my mind for quite while now, so much so that I've decided to make it a reality. Ever since switching to linux, I've been intrigued on ways to create an operating system which can be synced across all my devices. This is exactly what TJ5-OS is, an Aurora-Based (Aurora (made by Universal Blue)), immutable Linux Operating System which brings across many tweaks from different distros, basically a one-stop shop for all tweaks. 

# Why use Aurora as a base? Why not Fedora Kinoite?
I first planned to use Fedora Kinoite to build this project, however I encountered issues with modified kernels and NVIDIA drivers.  Aurora uses its HWE images to give the Bazzite kernel, which is applied by default to the Bazzite image created by Universal Blue.  Aurora also offers stability and dependability because the NVIDIA drivers and Bazzite kernel are pre-installed.

Basically, Aurora provides a higher level of system stability and hardware support, whilst still being a great base.

# The Build Process

Currently, The build process can be depicted in 4 Stages, which takes place in 2 repositories - 

Step 1 - Obtaining The base Aurora image - this is done in the repo https://github.com/tj5miniop/ublue-rolling-images

Step 2 - Tweaking The base image - this involves installing some general optimisations, such as kernel modules, modesettings and installing packages. this is done in the repo https://github.com/tj5miniop/ublue-rolling-images

Step 3 - Obtaining the tweaked base image - this is done in this repo

Step 4 - Building the Final Image - this is done in this repo. This process involves swapping out files and installing flatpak applications etc to create a more complete experience


# Contributing
Feel free to fork this repo and create a pull request for any new features for this image! If you want to test these out before creating a pull request, use cosign to create a set of keys and use these to build the image.
More info on how to contribute to the ublue-rolling-images repo can be found here ; https://github.com/tj5miniop/ublue-rolling-images




## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed. You can either use RPM-OSTREE or BOOTC (Fedora 41+ (Universal Blue images included) - DO NOT REBASE TO IMAGES THAT CONTAIN DIFFERENT DESKTOP ENVIRONMENTS!!
  RPM-OSTREE
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/tj5miniop/tj5-os:latest
  ```

  BOOTC
  ```
  sudo bootc switch ostree-unverified-registry:ghcr.io/tj5miniop/tj5-os:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/tj5miniop/tj5-os:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/tj5miniop/tj5-os
```
