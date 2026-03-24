#!/bin/bash

security_group_id="sg-XXXXXXXXXXXXXXXXXX"

instance_id=$(aws ec2 run-instances \
  --image-id ami-0360c520857e3138f \
  --instance-type t2.micro \
  --key-name vockey \
  --security-group-ids $security_group_id \
  --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"VolumeSize":20}}]' \
  --user-data file://user_data.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=RodrigoRodrigues-ServidorWeb}]' \
  --query "Instances[0].InstanceId" \
  --output text)
    

echo "instancia criada: $instance_id"

aws ec2 wait instance-running --instance-ids $instance_id

#liberar porta
aws ec2 authorize-security-group-ingress \
  --group-id $security_group_id \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0

#get ip publico
ippublico=$(aws ec2 describe-instances \
  --instance-ids $instance_id \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "IP Público: $ippublico"