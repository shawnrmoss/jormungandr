
FROM ubuntu:18.04 

# Update ubuntu and install OS tools
RUN apt-get update -y && \
    apt-get install -y apt-utils build-essential pkg-config libssl-dev curl git

# Install Rust compiler and add binaries to path
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH "$PATH:/root/.cargo/bin"
RUN rustup install stable && \
    rustup default stable 

# Install Jormungandr
RUN git clone --recurse-submodules https://github.com/input-output-hk/jormungandr /jormungandr && \
    cd /jormungandr && \
    cargo install --path jormungandr && \
    cargo install --path jcli

# Quick-start in private BFT mode
RUN mkdir /test && \
    /bin/bash /jormungandr/scripts/bootstrap -b | tee /test/initial_configuration.txt
ENTRYPOINT [ "jormungandr", "--genesis-block", "./block-0.bin", "--config", "./config.yaml", "--secret", "./pool-secret1.yaml" ]