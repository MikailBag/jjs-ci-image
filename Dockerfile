FROM ubuntu:bionic
ARG CONCURRENCY=4
ARG RUST_VERSION
ENV RUST_VERSION=${RUST_VERSION:-"2019-08-01"}
ADD install-packages.sh install-rust-toolchain.sh  /tmp/
RUN bash /tmp/install-packages.sh
ENV PATH=$PATH:/root/.cargo/bin
RUN bash /tmp/install-rust-toolchain.sh
