#!/bin/bash
aws iam delete-role-policy --role-name easec-CodePipelineServiceRole --policy-name codepipeline-access 
aws iam delete-role --role-name eksworkshop-CodePipelineServiceRole
aws iam delete-role-policy --role-name eksworkshop-CodeBuildServiceRole --policy-name codebuild-access 
aws iam delete-role --role-name eksworkshop-CodeBuildServiceRole


ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
aws s3 rb s3://easec-${ACCOUNT_ID}-codepipeline-artifacts --force
