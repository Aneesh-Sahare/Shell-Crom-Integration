#!/bin/bash

#log storage location#
LOGFILE="home/aws/log"



echo "AWS Resource Report:" >> $LOGFILE
date >> $LOGFILE

# List S3 buckets
echo " S3 Buckets:" >> $LOGFILE
aws s3 ls >> $LOGFILE

# List EC2 instances
echo "EC2 Instances :" >> $LOGFILE
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PrivateIpAddress]" --output table >> $LOGFILE

# List IAM users
echo "IAM Users" >> $LOGFILE
aws iam list-users --query "Users[*].[UserName,CreateDate]" --output table >> $LOGFILE

echo "" >> $LOGFILE
