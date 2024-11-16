#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

#rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# remove some base packages
rpm-ostree override remove \
	virtualbox-guest-additions \
	nano nano-default-editor \
	plocate yelp gnome-tour \
	--install vim-default-editor

# install preferred packages
# one space and a backslash after every line, EXCEPT the last one
rpm-ostree install \
    NetworkManager-tui \
    celluloid \
    curl \
    ffmpeg \
    gvfs-nfs \
    htop \
    keepassxc \
    rsync \
    seahorse \
    syncthing \
    tmux \
    yt-dlp
