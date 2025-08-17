#!/usr/bin/env bash
# scripts/deploy-nginx.sh
set -euo pipefail

echo "🚀 Deploying NGINX Ingress Controller..."

NAMESPACE="ingress-nginx"

# Create namespace (idempotent)
kubectl create namespace "${NAMESPACE}" --dry-run=client -o yaml | kubectl apply -f -

# Add/refresh Helm repo (idempotent, show output for reassurance)
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx || true
helm repo update

# Install/upgrade NGINX ingress with cross-cloud defaults
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  -n "${NAMESPACE}" \
  --version 4.13.1 \
  --set controller.ingressClassResource.name=nginx \
  --set controller.ingressClassResource.controllerValue="k8s.io/ingress-nginx" \
  --set controller.ingressClassResource.default=true \
  --set controller.service.type=LoadBalancer \
  --set controller.service.externalTrafficPolicy=Local \
  --set controller.config.use-forwarded-headers="true"

echo "✅ NGINX Ingress Controller deployed."

# Helpful outputs
kubectl -n "${NAMESPACE}" rollout status deploy/ingress-nginx-controller --timeout=5m

# Give the cloud LB a moment to allocate an address
sleep 10

kubectl -n "${NAMESPACE}" get svc ingress-nginx-controller -o wide

echo -n "🌐 External address: "
kubectl -n "${NAMESPACE}" get svc ingress-nginx-controller \
  -o jsonpath='{.status.loadBalancer.ingress[0].ip}{.status.loadBalancer.ingress[0].hostname}'
echo