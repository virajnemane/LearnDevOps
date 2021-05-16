#!/bin/sh
TERRAFORM_VER=`curl --silent https://releases.hashicorp.com/terraform/ |grep terraform |tac |tail -n1 |awk '{split($2,c,">"); split(c[2],d,"<"); split(d[1],e,"_"); print e[2]}'`
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
unzip terraform_${TERRAFORM_VER}_linux_amd64.zip -d /usr/local/bin
mkdir /home/ec2-user/terraform
cd /home/ec2-user/terraform
chown ec2-user:ec2-user /home/ec2-user/terraform -R