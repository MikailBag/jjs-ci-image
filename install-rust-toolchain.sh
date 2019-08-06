#!/usr/bin/env bash

rustup default nightly-2019-07-03
rustup component add clippy rustfmt
rustup target add x86_64-unknown-linux-musl
cargo install just mdbook
