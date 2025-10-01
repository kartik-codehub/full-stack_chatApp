#!/bin/bash

NAMESPACE="chat-app"

echo "🚀 Applying manifests in correct order for namespace: $NAMESPACE"

# 1. Namespace
kubectl apply -f namespace.yml

# 2. Secrets
kubectl apply -f secrets.yml -n $NAMESPACE

# 3. MongoDB Storage (PV, PVC)
kubectl apply -f mongodb-pv.yml -n $NAMESPACE
kubectl apply -f mongodb-pvc.yml -n $NAMESPACE

# 4. MongoDB Deployment & Service
kubectl apply -f mongodb-deployment.yml -n $NAMESPACE
kubectl apply -f mongodb-service.yml -n $NAMESPACE

# 5. Backend Deployment & Service
kubectl apply -f backend-deployment.yml -n $NAMESPACE
kubectl apply -f backend-service.yml -n $NAMESPACE

# 6. Frontend Deployment & Service
kubectl apply -f frontend-deployment.yml -n $NAMESPACE
kubectl apply -f frontend-service.yml -n $NAMESPACE

echo "✅ All manifests applied successfully!"
