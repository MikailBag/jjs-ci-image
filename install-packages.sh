#!/usr/bin/env bash

apt update -y
apt install -y apt-transport-https software-properties-common wget
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt update -y
add-apt-repository universe
apt update -y
apt install -y automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config musl \
    musl-tools cmake powershell curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain none

