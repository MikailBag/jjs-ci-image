#!/usr/bin/env bash
VERSION="2019-07-30"
echo Installing Rust nightly release ${VERSION}
rustup default nightly-${VERSION}
echo Installing additional components
rustup component add clippy rustfmt
echo Installing musl target support
rustup target add x86_64-unknown-linux-musl
echo Installing additional tools
cargo install just mdbook
