#!/bin/bash

# Exporting the environment variables
export SYSTEM_NAMESPACE="tekton-pipelines"
export KUBERNETES_SERVER_HOST="localhost"
export KUBERNETES_SERVER_PORT="38657"


echo "Environment variables have been set."

# Next steps
# export KUBECONFIG=~/.kube/config.kind
# k config use-context kind-tekton-results
# source ./env_variables_watcher.sh
# go run cmd/watcher/main.go --api_addr=localhost:8443 --auth_mode=insecure