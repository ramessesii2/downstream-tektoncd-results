# Debugging Tekton Results in a Development Environment

## Pre-requisite

- See [DEVELOPMENT.md](../DEVELOPMENT.md)

## Section 1: Setting Up the Development Environment

Tekton Results relies on the CRDs deployed by Tekton Pipelines and needs a Database to push/pull resources.

### 1.1: Launch Kind cluster deploying Tekton Pipelines

- Just run the setup script to setup Kind cluster or create a Kind Cluster manually deploying latest Kubernetes node images.

    ```sh
    ./test/e2e/00-setup.sh    # sets up kind cluster
    ```

- Grab the server address of your kind cluster

    ```sh
    kubectl cluster-info --context kind-tekton-results
    ```

    It should look like -

    ```sh
    Kubernetes control plane is running at https://127.0.0.1:8443
    CoreDNS is running at https://127.0.0.1:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
    ```

    Grab the server address, here- `https://127.0.0.1:8443`, we'll be using this to populate environment variables for [API server](./env_api.sh) and [Watcher](./env_watcher.sh) which are `KUBERNETES_SERVICE_HOST` & `KUBERNETES_SERVICE_PORT` and `KUBERNETES_SERVER_HOST` & `KUBERNETES_SERVER_PORT` respectively.

- Deploy Tekton Pipelnes.

    ```sh
    kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml >/dev/null
    ```
    <!-- TODO:  Bonus: Deploy Tekton Dashboard-->

### 1.2: Launch a Postgres instance in a container

It's easier to get ephimeral postgres instance using Podman/Docker.

- Using Podman:

  - Pull Postgres image

    ```sh
    podman pull docker.io/library/postgres@sha256:723a8213f1e94e2ca2aa4335d441eb939ed010ec51821ffa8b381d55a0a20854
    ```

    while Postgres with latest tags are supposed to work, the above sha has been verified to be compatible with Tekton Results.

  - Run a Postgres container named tekton in our case.

    ```sh
    podman run --name tekton -e POSTGRES_PASSWORD={DB_PASSWORD} -p 5432:5432 postgres
    ```

    `{DB_PASSWORD}` placeholder can be assigned arbitrary value but need to modify the variable in [API env config](./env_api.sh).

## Section 2: Running Tekton Results Components Locally

### 2.1: Results API Server

- Setup necessary environment variables, for a comprehensive list refer - [API Config](../../pkg/api/server/config/config.go)

    ```sh
     source ./env_api.sh
    ```

- Run the API server

    ```sh
    go run cmd/api/main.go
    ```

### 2.2: Results Watcher

- Setup necessary environment variables.

    ```sh
     source ./env_watcher.sh
    ```

- Configure ConfigMap to see the DEBUG logs. For simplicity, we'll just configure the `config-logging` config map deployed by Tekton Pipelines.

    ```sh
    kubectl apply -f debug-config-cm.yaml
    ```
    <!-- TO DO: Use a separate config-map -->

<!-- - Optionally, add a section to do a Go Profiling -->

- Run the Results Watcher

    ```sh
    go run cmd/watcher/main.go --api_addr=localhost:9448 --auth_mode=insecure --completed_run_grace_period=10m --requeue_interval=1m
    ```

    Note: Flag `api_addr` is the address where the API server is running, if you're using default environment variables from the docs, then it should be `SERVER_PORT="9448"`

## Section 3: Debugging with Visual Studio Code

In VS Code, create debugger profiles passing appropriate environment variables and args. For example:-

- Debugging API Server

```json
        {
            "name": "Launch Results API Package",
            "type": "go",
            "request": "launch",
            "mode": "auto",
            "program": "${fileDirname}",
            "env": {
                "AUTH_DISABLE": "true",
                "AUTH_IMPERSONATE": "true",
                "DB_ENABLE_AUTO_MIGRATION": "true",
                "DB_HOST": "localhost",
                "DB_NAME": "tekton",
                "DB_PASSWORD": {DB_PASSWORD},
                "DB_PORT": "5432",
                "DB_USER": "postgres",
                "KUBERNETES_SERVICE_HOST": "localhost",
                "KUBERNETES_SERVICE_PORT": "38657",
                "LOG_LEVEL": "debug",
                "LOGS_API": "true",
                "LOGS_BUFFER_SIZE": "536343",
                "LOGS_PATH": "/tmp/tekton/logs",
                "LOGS_TYPE": "File",
                "PROMETHEUS_HISTOGRAM": "true",
                "PROMETHEUS_PORT": "9090",
                "SERVER_PORT": "9448",
                "SYSTEM_NAMESPACE": "tekton-pipelines",
                "KUBECONFIG": "/home/ramesses/.kube/config.kind"
            },
        }
```

- Debugging Watcher

```json
        {
            "name": "Launch Watcher Package",
            "type": "go",
            "request": "launch",
            "mode": "debug",
            "program": "${fileDirname}",
            "env": {
                "KUBECONFIG": "/home/ramesses/.kube/config.kind",
                "SYSTEM_NAMESPACE": "tekton-pipelines",
                "CONFIG_OBSERVABILITY_NAME": "watcher-config-observability",
                "KUBERNETES_SERVER_HOST": "localhost",
                "KUBERNETES_SERVER_PORT": "8443",
            },
            "args": [
                "--api_addr=localhost:9448",
                "--auth_mode=insecure",
                "--completed_run_grace_period=10m"
            ]
        },
```
