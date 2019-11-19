#!/usr/bin/env bash
apt update -y
apt install -y curl gnupg2
curl -q -o /dev/stdout https://files.viva64.com/etc/pubkey.txt | apt-key add -
curl -o /etc/apt/sources.list.d/viva64.list https://files.viva64.com/etc/viva64.list
apt-get update
apt install -y automake bison flex g++ git libevent-dev libssl-dev libtool make pkg-config cmake curl pvs-studio --no-install-recommends
