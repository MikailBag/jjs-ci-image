FROM ubuntu:bionic
ARG CONCURRENCY=4
ENV RUSTUP_HOME=/root
ADD install-packages.sh install-rust-toolchain.sh  /tmp/
RUN bash /tmp/install-packages.sh
RUN bash /tmp/install-rust-toolchain.sh
ENTRYPOINT cargo
