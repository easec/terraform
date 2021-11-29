#!/bin/bash

helm uninstall helm-operator --namespace flux
helm uninstall flux --namespace flux
kubectl delete namespace flux 
kubectl delete crd helmreleases.helm.fluxcd.io

helm uninstall mywebserver -n nginx
kubectl delete namespace nginx
kubectl delete svc eks-example -n eks-example
kubectl delete deployment eks-example -n eks-example
kubectl delete namespace eks-example



aws iam delete-role-policy --role-name easec-CodePipelineServiceRole --policy-name codepipeline-access 
aws iam delete-role --role-name easec-CodePipelineServiceRole
aws iam delete-role-policy --role-name easec-CodeBuildServiceRole --policy-name codebuild-access 
aws iam delete-role --role-name eksworkshop-CodeBuildServiceRole


ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
aws s3 rb s3://easec-${ACCOUNT_ID}-codepipeline-artifacts --force
