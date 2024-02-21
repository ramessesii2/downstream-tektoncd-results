#!/bin/bash

# Exporting the environment variables
export SYSTEM_NAMESPACE="tekton-pipelines"
export KUBERNETES_SERVER_HOST="localhost"
export KUBERNETES_SERVER_PORT="8443"
export CONFIG_OBSERVABILITY_NAME="watcher-config-observability"
export KUBECONFIG=~/.kube/config.kind

echo "Environment variables have been set."

# Next steps
# export KUBECONFIG=~/.kube/config.kind
# k config use-context kind-tekton-results
# source ./env_variables_watcher.sh
# go run cmd/watcher/main.go --api_addr=localhost:9443 --auth_mode=insecure
