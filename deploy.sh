#!/bin/bash

uri='ssh -i /home/ubuntu/.ssh/id_rsa ubuntu@52.67.249.96'

export TF_VAR_vpcId=$($uri 'aws --region sa-east-1 ec2 describe-vpcs --filters Name=tag:Name,Values=vpc-Team4-JB --query "Vpcs[*].VpcId" --output text')
export TF_VAR_subnetPrivada=$($uri 'aws --region sa-east-1 ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-0f50e5ca99893dcc9" "Name=tag:Name,Values=*Priv*" --query "Subnets[1].SubnetId" --output text')

echo $TF_VAR_vpcId
echo $TF_VAR_subnetPrivada
