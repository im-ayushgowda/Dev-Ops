#!/bin/bash

#####################
#AUTHOR : Ayush L M
#DATE : 20-06-2026
#This a script for tracking aws resources and report the usage
#VERSION : v1
####################

set -x          # print each command before executing (debugging)
set -u          # treat unset variables as an error
set -o pipefail # catch failures in piped commands
set -e          # exit immediately on any command failure

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

echo "=================================================="
echo "Run started at: $(date '+%Y-%m-%d %H:%M:%S')"
echo "=================================================="

#list s3 buckets
echo "Print the list of s3 buckets"
aws s3 ls

#list EC2 Instances
echo "Print the list ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#list lambda functions
echo "Print the list of lambda functions"
aws lambda list-functions

#list IAM users
echo "Print the list of IAM users"
aws iam list-users

echo "=================================================="
echo "Run finished at: $(date '+%Y-%m-%d %H:%M:%S')"
echo "=================================================="


