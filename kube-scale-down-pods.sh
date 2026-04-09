#!/bin/bash

NAMESPACE=default
DEPLOYMENT_NAME=dogood

echo "Scaling deployment to 0 replica..."
kubectl scale deployment $DEPLOYMENT_NAME --replicas=0 -n $NAMESPACE

echo "Waiting for rollout to finish..."
kubectl rollout status deployment $DEPLOYMENT_NAME -n $NAMESPACE

echo "Done."
