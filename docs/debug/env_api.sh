#!/bin/bash

# Exporting the environment variables
export AUTH_DISABLE=true # or false
export AUTH_IMPERSONATE=true # or false
export DB_ENABLE_AUTO_MIGRATION=true # or false
export DB_HOST="localhost"
export DB_NAME="tekton"
export DB_PASSWORD={{DB_PASSWORD}}
export DB_PORT="5432"
export DB_SSLMODE=disable
# export DB_SSLROOTCERT=
export DB_USER=postgres
# export GCS_BUCKET_NAME="your_value"

export KUBERNETES_SERVICE_HOST="localhost"
export KUBERNETES_SERVICE_PORT="8443"
export KUBECONFIG=~/.kube/config.kind

export LOG_LEVEL="debug"
export LOGS_API=true # or false
export LOGS_BUFFER_SIZE=536343
export LOGS_PATH="/tmp/tekton/logs"
export LOGS_TYPE="File"
export PROMETHEUS_HISTOGRAM=true # or false
export PROMETHEUS_PORT="9090"
# export S3_ACCESS_KEY_ID="your_value"
# export S3_BUCKET_NAME="your_value"
# export S3_ENDPOINT="your_value"
# export S3_HOSTNAME_IMMUTABLE=true # or false
# export S3_MULTI_PART_SIZE=your_integer_value64
# export S3_REGION="your_value"
# export S3_SECRET_ACCESS_KEY="your_value"

export SERVER_PORT="9448"
# export STORAGE_EMULATOR_HOST="your_value"
# export TLS_HOSTNAME_OVERRIDE="your_value"
# export TLS_PATH="your_value"

echo "Environment variables have been set."
# Next Steps
# k config use-context kind-tekton-results
# source ./env_api.sh
# go run cmd/api/main.go
