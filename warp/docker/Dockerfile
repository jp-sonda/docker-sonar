# Veja http://zderadicka.eu/static-build-of-rust-executables/

FROM alpine:edge AS build

RUN apk update && \
    apk add git build-base openssl-dev \
    rust cargo && \
    mkdir /app
COPY app /app
RUN find /app    
WORKDIR /app

# ENV RUSTFLAGS="-C target-feature=+crt-static"
# RUN cargo build --target x86_64-alpine-linux-musl --release --verbose && \
# RUN find / -name libgcc_s.so.1 && rustc --print target-list
RUN cargo build --target x86_64-alpine-linux-musl --release --verbose 
# RUN find /app && file /app/target/x86_64-alpine-linux-musl/release/hello && \
#     echo "*****************" && find / -type f -name "libgcc_s.so.1" && \
#     echo "WVW - " && /app/target/x86_64-alpine-linux-musl/release/hello

# This results in a five layer image
# See this: https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
# FROM scratch
FROM alpine:edge
COPY --from=build /app/target/x86_64-alpine-linux-musl/release/hello /bin/hello
COPY --from=build /usr/lib/libgcc_s.so.1  /lib/
# RUN find /bin | sort | xargs && echo "*****************" && find /lib | sort  && echo "****************"  && find /usr/lib | sort  && echo "****************"
# ENTRYPOINT ["/bin/hello"]
# CMD ["--help"]
CMD ["/bin/hello"]
