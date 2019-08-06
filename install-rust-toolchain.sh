#!/usr/bin/env bash
echo Installing Rust nightly release ${RUST_VERSION}
rustup default nightly-${RUST_VERSION}
echo Installing additional components
rustup component add clippy rustfmt
echo Installing musl target support
rustup target add x86_64-unknown-linux-musl
echo Installing additional tools
cargo install just mdbook --jobs ${CONCURRENCY}
