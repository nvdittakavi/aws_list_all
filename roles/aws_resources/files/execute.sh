#!/bin/bash
# Name: Venkata Nagendra Dittakavi
# Email: venkat.nagendra@capgemini.com
# Shell Script to check for all the resources across all the regoins on AWS
# Executes on RedHat or its Linux Flavours

#Install Ansible and Configure
sudo yum  install  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo yum update -y
sudo yum repolist
sudo yum install ansible -y
ansible --version

#Install Ansible and Configure for RHEL 8
#sudo dnf update
#sudo dnf install python3
#sudo dnf install python3-pip
#pip3 install ansible --user
#ansible --version

# Install Dependencies
sudo yum install pip -y
sudo yum install git -y
sudo pip install aws-list-all

# Clone the Git Repository
git clone https://github.com/nvdittakavi/aws_list_all.git
cd aws_list_all

# Edit the Region and Services File
ansible-vault edit resources.vault

# Execute the Ansible Scripts
ansible-playbook site.yml --ask-vault-pass
