@echo off
REM Windows CMD script to run Fishtest worker in Docker
REM NOTE: For easier parameter customization, use run.ps1 (PowerShell) instead
REM To customize parameters, edit the lines below directly (no inline comments allowed in CMD)

docker run -d --name fishtest-worker --rm -v /home/fishtest -e USERNAME="your_user" -e PASSWORD="your_pass" fishtest-worker:latest

REM To add parameters, replace the line above with something like:
REM docker run -d --name fishtest-worker --rm -v /home/fishtest -e USERNAME="your_user" -e PASSWORD="your_pass" -e CONCURRENCY="MAX" fishtest-worker:latest

echo Fishtest worker container started
echo Container name: fishtest-worker
echo.
echo To view logs: docker logs -f fishtest-worker
echo To stop: docker stop fishtest-worker