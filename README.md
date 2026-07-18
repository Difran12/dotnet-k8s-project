# MyDotnetApp - Zero to Production

A .NET 8 Web API project with a complete "Zero to Production" pipeline, including Dockerization, Kubernetes manifests, and a GitHub Actions CI/CD workflow.

## 🚀 Features
- **.NET 8 Web API:** Built with the latest minimal API template (WeatherForecast).
- **Docker Multi-Stage Build:** Optimized `Dockerfile` separating the build and runtime environments.
- **Kubernetes Ready:** Includes standard `Deployment` and `Service` (LoadBalancer) manifests.
- **CI/CD Pipeline:** GitHub Actions workflow (`deploy.yml`) to automatically test, build, and push the image to GitHub Container Registry (GHCR).

## 📂 Project Structure
- `src/MyDotnetApp.WebApi/`: The main .NET 8 Web API project.
- `src/MyDotnetApp.Tests/`: xUnit testing project.
- `k8s/`: Kubernetes deployment and service manifests.
- `.github/workflows/`: GitHub Actions CI/CD configuration.
- `Dockerfile`: Multi-stage Docker configuration.

## 💻 Running Locally

### 1. Using .NET CLI
Run the application directly using the .NET SDK:
```bash
dotnet run --project src/MyDotnetApp.WebApi/MyDotnetApp.WebApi.csproj
```
*(Make sure you are inside the `dotnet-k8s-project` directory)*

### 2. Using Docker
Build and run the Docker image locally:
```bash
docker build -t my-api:lokal .
docker run -p 8080:8080 my-api:lokal
```

## ☁️ Deployment (Kubernetes)
The CI/CD pipeline currently builds and pushes the image to GitHub Container Registry (`ghcr.io`).
To fully deploy to a Kubernetes cluster:
1. Ensure your cluster is running and accessible.
2. Add your cluster's `KUBE_CONFIG` to the GitHub Repository Secrets.
3. Uncomment the `deploy` job inside `.github/workflows/deploy.yml`.
