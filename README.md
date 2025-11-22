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

## Credential Safety

**Important:** Before editing any file with your credentials, copy it to a `-my` version first.
Files ending with `-my.*` are in `.gitignore` and will not be committed to the repository.

For Docker run scripts:
```bash
cp run.bash run-my.bash
# Edit run-my.bash with your credentials
./run-my.bash
```

For Kubernetes deployment:
```bash
cp kubernetes-sample-deployment.yaml kubernetes-sample-deployment-my.yaml
# Edit kubernetes-sample-deployment-my.yaml with your credentials
kubectl apply -f kubernetes-sample-deployment-my.yaml
```

## Kubernetes Deployment

See `kubernetes-sample-deployment.yaml` for a sample deployment configuration with:
- 3 replicas (one per node using pod anti-affinity)
- Secret for credentials
- emptyDir volume for fishtest data
- Ephemeral storage limits

To deploy:
1. Copy `kubernetes-sample-deployment.yaml` to `kubernetes-sample-deployment-my.yaml`
2. Edit `kubernetes-sample-deployment-my.yaml` with your actual username and password
3. Apply: `kubectl apply -f kubernetes-sample-deployment-my.yaml`
4. Verify: `kubectl get pods -n fishtest-worker -o wide`
