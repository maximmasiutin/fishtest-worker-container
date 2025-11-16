Fishtest Worker - Docker Setup

## Quick Start with Pre-built Image

A pre-built image is available on Docker Hub: `maximmasiutin/fishtest-worker:latest`

Pull and run:
```bash
docker pull maximmasiutin/fishtest-worker:latest
docker run -d --name fishtest-worker --rm -v /home/fishtest \
  -e USERNAME="your_username" \
  -e PASSWORD="your_password" \
  -e CONCURRENCY="MAX" \
  -e MAX_MEMORY="MAX" \
  maximmasiutin/fishtest-worker:latest
```

## Build from Source (Optional)

1. Build the image: `docker build -t fishtest-worker:latest .`
2. Run on Windows PowerShell: `.\run.ps1`
3. Run on Windows CMD: `run.cmd` (basic version, use PowerShell for easier customization)
4. Run on Bash/WSL/Git Bash: `./run.bash`
5. Edit run.ps1 or run.bash to set worker parameters (USERNAME, PASSWORD, CONCURRENCY, etc.) - just fill in the empty strings
6. You can rename .ps1 or .cmd or .bash files to -my (e.g. run-my.cmd) because they are in .gitignore
