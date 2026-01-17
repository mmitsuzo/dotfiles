#!/bin/sh

aws ec2 describe-instances \
	--output text \
       	--query "Reservations[].Instances[].InstanceId" \
	| xargs aws ec2 terminate-instances --instance-ids

