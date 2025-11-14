# PowerShell script to run Fishtest worker in Docker
# All parameters are optional - just set the values you need (leave empty strings for defaults)

docker run -d --name fishtest-worker --rm -v /home/fishtest `
  -e USERNAME="" `
  -e PASSWORD="" `
  -e PROTOCOL="" `
  -e HOST="" `
  -e PORT="" `
  -e CONCURRENCY="" `
  -e MAX_MEMORY="" `
  -e UUID_PREFIX="" `
  -e MIN_THREADS="" `
  -e FLEET="" `
  -e GLOBAL_CACHE="" `
  fishtest-worker:latest

Write-Host "Fishtest worker container started"
Write-Host "Container name: fishtest-worker"
Write-Host ""
Write-Host "To view logs: docker logs -f fishtest-worker"
Write-Host "To stop: docker stop fishtest-worker"
