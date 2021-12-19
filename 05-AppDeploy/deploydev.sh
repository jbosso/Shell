#!/bin/bash

cd 05-AppDeploy/ansible

export masterIP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=k8s-master0 --query "Reservations[*].Instances[*].[PrivateIpAddress]" --output text)


#echo "[k8s-master0]" > ../ansible/hosts
#echo $masterIP >> ../ansible/hosts


echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionarDev.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa
