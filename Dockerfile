FROM ubuntu:bionic
ARG concurrency=4
ADD install-packages.sh install-rust-toolchain.sh  /tmp/
RUN bash /tmp/install-packages.sh
ENV PATH=$PATH:~/.cargo/bin
RUN bash /tmp/install-rust-toolchain.sh
