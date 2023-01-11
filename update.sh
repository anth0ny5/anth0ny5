#!/bin/bash

cd /etc

## Test if the local host is Arch-based
if [ -d /etc/pacman.d ]
then
        ## Run the Arch version of the update command
        sudo pacman -Syu
fi

## Test if the local host is Debian-based
if [ -d /etc/apt ]
then
        ## Run the Debian version of the upgrade command
        sudo apt update && sudo apt upgrade -y
fi

## Test if the local host is Centos
if [ -d /etc/yum ]
then
        ## Run the Centos version of the upgrade command
        sudo yum check-update | sudo yum upgrade -y
fi

cd /usr

## Test if the local host is Fedora - RedHat
if [ -e /usr/bin/dnf ]
then
        ## Run the Fedora - RedHat version of the upgrade command
        sudo dnf check-update | sudo dnf upgrade -y
fi
