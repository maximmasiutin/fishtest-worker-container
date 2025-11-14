# Dockerfile
FROM alpine:latest

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    bash \
    g++ \
    gcc \
    make \
    git \
    musl-dev \
    linux-headers \
    openssh-client \
    ca-certificates \
    libc-dev \
    procps \
    binutils

# Install Python dependencies
RUN pip3 install --no-cache-dir --break-system-packages \
    requests>=2.25.1 \
    openlock>=1.1.5 \
    expression-parser>=0.0.6

# Configure git
RUN git config --global --add safe.directory '*'

# Create fishtest user
RUN adduser -D -H -s /bin/bash fishtest

# Create mount point
RUN mkdir -p /home/fishtest && chown fishtest:fishtest /home/fishtest

USER fishtest
WORKDIR /home/fishtest
VOLUME ["/home/fishtest"]

# Use JSON form for proper signal handling while allowing environment variable expansion
CMD ["/bin/sh", "-c", "git clone https://github.com/official-stockfish/fishtest.git && cd fishtest/worker && python3 worker.py ${USERNAME:-} ${PASSWORD:-} ${PROTOCOL:+--protocol ${PROTOCOL}} ${HOST:+--host ${HOST}} ${PORT:+--port ${PORT}} ${CONCURRENCY:+--concurrency ${CONCURRENCY}} ${MAX_MEMORY:+--max_memory ${MAX_MEMORY}} ${UUID_PREFIX:+--uuid_prefix ${UUID_PREFIX}} ${MIN_THREADS:+--min_threads ${MIN_THREADS}} ${FLEET:+--fleet ${FLEET}} ${GLOBAL_CACHE:+--global_cache ${GLOBAL_CACHE}}"]