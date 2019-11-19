#!/usr/bin/env bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain none
source $HOME/.cargo/env
rustup toolchain install nightly --component clippy --component rustfmt
rustup default nightly