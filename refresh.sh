#!/usr/bin/env bash
set -eo pipefail

ECR_TOKEN=$(aws ecr get-login-password --region "${AWS_REGION}")
kubectl delete secret --ignore-not-found "$DOCKER_SECRET_NAME" -n "$NAMESPACE_NAME"
kubectl create secret docker-registry "$DOCKER_SECRET_NAME" \
  --docker-server="https://${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com" \
  --docker-username=AWS \
  --docker-password="${ECR_TOKEN}" \
  --namespace="${NAMESPACE_NAME}"

echo "Secret was successfully updated at $(date)"
