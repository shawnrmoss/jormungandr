
FROM alpine:3.8 

# Update install tools
RUN apk update && apk upgrade && \
    apk add --no-cache bash git

FROM rust:1.39.0

# Download the target for static linking.
# RUN rustup target add x86_64-unknown-linux-musl

# Install Jormungandr
RUN git clone --recurse-submodules https://github.com/input-output-hk/jormungandr /jormungandr && \
    cd /jormungandr && \
    cargo install --path jormungandr && \
    cargo install --path jcli

# Quick-start in private BFT mode
RUN mkdir /test && \
    /bin/bash /jormungandr/scripts/bootstrap -b | tee /test/initial_configuration.txt
ENTRYPOINT [ "jormungandr", "--genesis-block", "./block-0.bin", "--config", "./config.yaml", "--secret", "./pool-secret1.yaml" ]