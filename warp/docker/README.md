# warp

O **warp** é escrito em Rust e portanto precisamos compilar os programas que usam o warp com o Rust compiler.

Podemos criar uma imagem usando Dockerfile disponǘel aqui para criar programas linkados estaticamente que podem ser copiados para outras maquinas compatíveis.

```docker
FROM alpine:edge AS build

RUN apk update && \
    apk add git build-base openssl-dev \
    rust cargo && \
    mkdir /src
COPY src/* /src/
RUN ls -la /src    
WORKDIR /src

ENV RUSTFLAGS="-C target-feature=+crt-static"
CMD  cargo build --target x86_64-alpine-linux-musl --release

RUN find /src

# This results in a single layer image
# See this: https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM scratch
COPY --from=build /bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["--help"]
```
 
depois executar `docker build -t parana/rust-static .`
