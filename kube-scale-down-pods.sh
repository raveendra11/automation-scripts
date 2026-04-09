#!/bin/bash

NAMESPACE=default
DEPLOYMENT_NAME=dogood

echo "Scaling deployment to 1 replica..."
kubectl scale deployment $dogood --replicas=0 -n $NAMESPACE

echo "Waiting for rollout to finish..."
kubectl rollout status deployment $dogood -n $NAMESPACE

echo "Done."
