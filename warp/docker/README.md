# warp

O **warp** é escrito em Rust e portanto precisamos compilar os programas que usam o warp com o Rust compiler.

Podemos criar uma imagem usando Dockerfile disponǘel aqui para criar programas linkados estaticamente que podem ser copiados para outras maquinas compatíveis.

```docker
FROM alpine:edge AS build

# VOLUME /src

RUN apk update &&\
    apk add git build-base openssl-dev \
    rust cargo &&\
    mkdir /src
WORKDIR /src

ENV RUSTFLAGS="-C target-feature=+crt-static"
CMD  cargo build --target x86_64-alpine-linux-musl --release
```
 
depois executar `docker build -t parana/rust-static .`
