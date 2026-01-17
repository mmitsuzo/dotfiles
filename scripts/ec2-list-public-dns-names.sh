#!/bin/sh

aws ec2 describe-instances \
	--output text \
       	--query "Reservations[].Instances[].PublicDnsName"
