#!/bin/bash

INSTANCE_NAME=dogood

echo "Stopping Cloud SQL instance..."

gcloud sql instances patch $INSTANCE_NAME \
    --activation-policy=NEVER

echo "Waiting for stop operation to complete..."

OPERATION_ID=$(gcloud sql operations list \
    --instance=$INSTANCE_NAME \
    --limit=1 \
    --format="value(name)")

gcloud sql operations wait $OPERATION_ID

echo "Instance stopped successfully."
