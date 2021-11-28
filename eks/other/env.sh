#!/bin/bash

export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
CLUSTER_NAME=production-eks-gZv50vSZ

echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export CLUSTER_NAME=${CLUSTER_NAME}" | tee -a ~/.bash_profile
