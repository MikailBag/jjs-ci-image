FROM rust:latest
ARG concurrency=4
RUN apt update -y
RUN apt install -y automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config musl musl-tools
RUN rustup default nightly-2019-02-20
RUN rustup component add clippy rustfmt
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install just mdbook
