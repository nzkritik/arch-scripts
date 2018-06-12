#!/bin/bash

# setup pacman
pacman --version --color always
# sync pacman first
pacman -Sy

# install reflector if not installed already
pacman -S --noconfirm --needed reflector

# update mirrors, sort by the 30 fastest and most recent repos
reflector --verbose --latest 30 --sort rate --save /etc/pacman.d/mirrorlist

# re-sync pacman with new mirrors
pacman -Syy

echo "#####################################"
echo "# mirrors updated and repos sync'd  #"
echo "#####################################"