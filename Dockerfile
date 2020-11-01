FROM rust:1.47.0-buster

RUN apt update

RUN apt install -y llvm-7 clang-7 libgc-dev zlib1g-dev git
RUN git clone --depth 1 https://github.com/yhara/shiika.git /usr/src/shiika

WORKDIR /usr/src/shiika
RUN cargo build --release

ENV LLC=llc-7 \
    CLANG=clang-7
CMD ["/usr/src/shiika/target/release/shiika"]
