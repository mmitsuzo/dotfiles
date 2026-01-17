#!/bin/sh

AMI="ami-0aec5ae807cea9ce0"
INSTANCE_TYPE="t3.micro"
KEY_NAME="awskey-tokyo-20260116"
SEC_GROUP="sg-0f9244c8a08c7fb62"

aws ec2 run-instances \
	--image-id ${AMI} \
	--instance-type ${INSTANCE_TYPE} \
	--key-name ${KEY_NAME} \
	--security-group-ids ${SEC_GROUP} \
	--count 1 \
	--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=UbuntuInstance}]'

