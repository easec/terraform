#!/bin/bash
cd ~
mkdir environment
cd environment

ACCOUNT_ID=$(aws sts get-caller-identity | jq -r '.Account')
aws s3 mb s3://easec-${ACCOUNT_ID}-codepipeline-artifacts

wget https://raw.githubusercontent.com/easec/terraform/main/eks/weave-flux/cpAssumeRolePolicyDocument.json

aws iam create-role --role-name easec-CodePipelineServiceRole --assume-role-policy-document file://cpAssumeRolePolicyDocument.json 

wget https://raw.githubusercontent.com/easec/terraform/main/eks/weave-flux/cpPolicyDocument.json

aws iam put-role-policy --role-name easec-CodePipelineServiceRole --policy-name codepipeline-access --policy-document file://cpPolicyDocument.json

wget https://raw.githubusercontent.com/easec/terraform/main/eks/weave-flux/cbAssumeRolePolicyDocument.json

aws iam create-role --role-name easec-CodeBuildServiceRole --assume-role-policy-document file://cbAssumeRolePolicyDocument.json 

wget https://raw.githubusercontent.com/easec/terraform/main/eks/weave-flux/cbPolicyDocument.json

aws iam put-role-policy --role-name easec-CodeBuildServiceRole --policy-name codebuild-access --policy-document file://cbPolicyDocument.json
