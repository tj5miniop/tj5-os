#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
wget -qO- https://git.io/papirus-icon-theme-install | sh

#Install Steam
# Perform a distro-sync (update) (again)
dnf5 -y update
dnf5 -y upgrade
#Install Steam - taken from fedora copr repo - cannot be used in tj5-os due to way it's built currently
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 -y update --refresh

 #Install Steam Package
dnf5 -y install steam --allowerasing