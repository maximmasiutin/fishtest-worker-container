# Dockerfile
FROM python:3.12-alpine

# Install system dependencies (build-base includes gcc, g++, make, musl-dev, libc-dev)
RUN apk add --no-cache \
    build-base \
    git \
    linux-headers \
    openssh-client \
    procps \
    binutils

# Install Python dependencies
RUN pip install --no-cache-dir requests openlock expression-parser

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
CMD ["/bin/sh", "-c", "pwd && ls -la && if [ ! -d fishtest ]; then echo 'Cloning...'; git clone https://github.com/official-stockfish/fishtest.git; else echo 'Pulling...'; (cd fishtest && git pull); fi && echo 'After pull:' && pwd && ls -la && ls -la fishtest/ && cd fishtest/worker && python3 worker.py ${USERNAME:-} ${PASSWORD:-} ${PROTOCOL:+--protocol ${PROTOCOL}} ${HOST:+--host ${HOST}} ${PORT:+--port ${PORT}} ${CONCURRENCY:+--concurrency ${CONCURRENCY}} ${MAX_MEMORY:+--max_memory ${MAX_MEMORY}} ${UUID_PREFIX:+--uuid_prefix ${UUID_PREFIX}} ${MIN_THREADS:+--min_threads ${MIN_THREADS}} ${FLEET:+--fleet ${FLEET}} ${GLOBAL_CACHE:+--global_cache ${GLOBAL_CACHE}}"]