#!/usr/bin/env bash
# Description: Setup necesary tools for the build.
# !!! Important: This is a temporary script for the PoC. Setup of the tooling will be done in Application Infra Image Factory.

set -ex

# Debug
echo "Building branch: $GIT_BRANCH" >> /dev/null

# Configure kubectl with latest creds from SSM Parameter Store
mkdir -p ${HOME:-/root}/.kube

# Assume role to CI alleged account
export CI_ACCOUNT="213997214095" # QA account ID

set +x  # Disable debug to prevent sensitive credentials data from being printed
QA_ROLE=$(aws sts assume-role --role-arn "arn:aws:iam::${CI_ACCOUNT}:role/InfrastructureCodeBuildCustomServiceRole" --role-session-name "ci_job_assume_role")
export AWS_ACCESS_KEY_ID=$(echo $QA_ROLE | jq .Credentials.AccessKeyId | xargs)
export AWS_SECRET_ACCESS_KEY=$(echo $QA_ROLE | jq .Credentials.SecretAccessKey | xargs)
export AWS_SESSION_TOKEN=$(echo $QA_ROLE | jq .Credentials.SessionToken | xargs)
set -x  # Enable debug

aws eks update-kubeconfig --name app-qa-infra-us-east-2-eks --role-arn "arn:aws:iam::${CI_ACCOUNT}:role/InfrastructureCodeBuildCustomServiceRole"
