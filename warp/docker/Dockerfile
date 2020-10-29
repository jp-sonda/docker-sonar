# Veja http://zderadicka.eu/static-build-of-rust-executables/

FROM alpine:edge AS build

# VOLUME /src

RUN apk update &&\
    apk add git build-base openssl-dev \
    rust cargo &&\
    mkdir /src
WORKDIR /src

ENV RUSTFLAGS="-C target-feature=+crt-static"
CMD  cargo build --target x86_64-alpine-linux-musl --release
