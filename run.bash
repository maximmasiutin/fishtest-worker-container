#!/bin/bash
# Bash script to run Fishtest worker in Docker (for Windows Git Bash/WSL/Linux)
# All parameters are optional - just set the values you need (leave empty strings for defaults)

docker pull maximmasiutin/fishtest-worker:latest
docker run -d --name fishtest-worker --rm -v /home/fishtest \
  -e USERNAME="" \
  -e PASSWORD="" \
  -e PROTOCOL="" \
  -e HOST="" \
  -e PORT="" \
  -e CONCURRENCY="" \
  -e MAX_MEMORY="" \
  -e UUID_PREFIX="" \
  -e MIN_THREADS="" \
  -e FLEET="" \
  -e GLOBAL_CACHE="" \
  fishtest-worker:latest

echo "Fishtest worker container started"
echo "Container name: fishtest-worker"
echo ""
echo "To view logs: docker logs -f fishtest-worker"
echo "To stop: docker stop fishtest-worker"
