#!/bin/sh

aws ec2 describe-instances \
	--output table \
       	--query "Reservations[].Instances[].[InstanceId, State.Name]"
