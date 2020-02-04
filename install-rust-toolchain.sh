#!/usr/bin/env bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain none
source $HOME/.cargo/env
rustup toolchain install nightly-2020-01-31 --component clippy --component rustfmt
rustup default nightly