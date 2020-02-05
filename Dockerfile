FROM rust:latest AS build
RUN apt update -y && apt install -y libunwind-dev
ENV CARGO_TARGET_DIR=/tmp/cargo
RUN cargo install mdbook --no-default-features
RUN cargo install cargo-udeps --no-default-features
RUN cargo install lxtrace --no-default-features

FROM ubuntu:bionic
ARG CONCURRENCY=4
ENV RUSTUP_HOME=/root
ADD install-rust-toolchain.sh /tmp/
RUN apt update -y && apt install -y  curl gnupg2
RUN curl -q -o /dev/stdout https://files.viva64.com/etc/pubkey.txt | apt-key add -
RUN curl -o /etc/apt/sources.list.d/viva64.list https://files.viva64.com/etc/viva64.list
RUN apt-get update -y && apt install -y automake g++ git libsystemd-dev systemd \
  libssl-dev libpq-dev libtool make pkg-config curl pvs-studio sudo \
  shellcheck wget \
  --no-install-recommends
RUN wget -q -O - https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.sh > /tmp/cmake.sh && \
  sudo bash /tmp/cmake.sh --skip-license --prefix=/usr
RUN bash /tmp/install-rust-toolchain.sh
COPY --from=build /usr/local/cargo/bin/* /root/.cargo/bin
ENV PATH="/root/.cargo/bin/:$PATH"
ENV DEBIAN_FRONTEND=noninteractive
