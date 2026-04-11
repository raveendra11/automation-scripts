#!/bin/bash

INSTANCE_NAME=dogood

echo "Starting Cloud SQL instance..."

gcloud sql instances patch $INSTANCE_NAME \
    --activation-policy=ALWAYS

echo "Waiting for instance to be RUNNABLE..."

OPERATION_ID=$(gcloud sql operations list \
    --instance=$INSTANCE_NAME \
    --limit=1 \
    --format="value(name)")

gcloud sql operations wait $OPERATION_ID

echo "Instance started successfully."
