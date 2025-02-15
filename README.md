# Go Web App

This repository contains a simple Go web application with a CI/CD pipeline using GitHub Actions, Docker, Kubernetes, Helm and ArgoCD.

## Table of Contents

- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Building and Running](#building-and-running)
- [CI/CD Pipeline](#cicd-pipeline)
- [Kubernetes Deployment](#kubernetes-deployment)
- [License](#license)

## Project Structure

```
.
├── .github/workflows/ci.yaml       # GitHub Actions workflow for CI/CD
├── .gitignore                      # Git ignore file
├── Dockerfile                      # Dockerfile for building the application
├── go.mod                          # Go module file
├── helm/                           # Helm chart for Kubernetes deployment
│   ├── go-webapp-helm/
│   │   ├── .helmignore
│   │   ├── Chart.yaml
│   │   ├── templates/
│   │   │   ├── manifests/
│   │   │   │   ├── deployment.yaml
│   │   │   │   ├── ingress.yaml
│   │   │   │   ├── service.yaml
│   │   ├── values.yaml
├── k8s/                            # Kubernetes manifests
│   ├── manifests/
│   │   ├── deployment.yaml
│   │   ├── ingress.yaml
│   │   ├── service.yaml
├── LICENSE                         # License file
├── main.go                         # Main application file
├── main_test.go                    # Test file for the application
├── static/                         # Static HTML files
│   ├── about.html
│   ├── contact.html
│   ├── courses.html
│   ├── home.html
```

## Getting Started

### Prerequisites

- Go 1.22 or later
- Docker
- Kubernetes cluster
- Helm
- ArgoCD on cluster

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/iam-veeramalla/go-web-app.git
    cd go-web-app
    ```

2. Install dependencies:
    ```sh
    go mod download
    ```

## Building and Running

### Build the application

```sh
go build -o go-webapp .
```

### Run the application

```sh
./go-webapp
```

The application will be available at `http://localhost:8080`.

## CI/CD Pipeline

The CI/CD pipeline is defined using GitHub Actions in `.github/workflows/ci.yaml`. It includes the following jobs:

- **Build**: Builds the Go application.
- **Unit tests**: Runs the unit tests.
- **Code quality**: Runs static code analysis using `golangci-lint`.
- **Docker**: Builds and pushes the Docker image to Docker Hub.
- **Update Helm chart**: Updates the Helm chart with the new Docker image tag.

## Kubernetes Deployment

### Using Helm

1. Install the application using helm chart:
    ```sh
    helm install <name-of-application-stack> -n <name-of-namespace> . -f .\values.yaml --create-namespace
    ```

### Using Kubernetes Manifests

1. Apply the Kubernetes manifests:
    ```sh
    kubectl apply -f k8s/manifests/
    ```

### changes deployed using ArgoCD

1. Changes in values.yaml file detected by argoCD.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.