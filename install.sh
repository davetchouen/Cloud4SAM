#!/bin/bash 
# This script is executed on the virtual machine during the 
Installation phase (need to be ran as root!). 
# It is used to record a predefined VM-image of the 
appliance. 
# Otherwise executed first during a cloud deployement in 
IFB-Biosphere 
# Install Ansible 
source /etc/os-release 
DIST_ID=$ID 
# DIST_ID=$(lsb_release -is) 
if [[ $DIST_ID = "ubuntu" || $DIST_ID = "debian" ]]; then 
    DIST_CODENAME=$(lsb_release -cs) 
    export DEBIAN_FRONTEND=noninteractive 
    APT_OPT="" 
    if [[ $DIST_ID = "debian" ]]; then 
        apt-get install -y software-properties-common 
dirmngr 
        if [[ $DIST_CODENAME == "stretch" || $DIST_CODENAME 
== "buster" ]]; then 
            apt-add-repository "deb http://deb.debian.org/
 debian ${DIST_CODENAME}-backports main"; 
        fi 
        APT_OPT="-t ${DIST_CODENAME}-backports --allow
unauthenticated" 
        apt-get -y --allow-unauthenticated dist-upgrade 
    elif [[ $DIST_CODENAME != "focal" ]]; then 
        apt-add-repository -y ppa:ansible/ansible 
    fi 
    apt-get update 
    apt-get install $APT_OPT -y ansible 
elif [[ $DIST_ID = "centos" ]]; then 
    yum install -y epel-release 
    yum install -y python3 
    python3 -m pip install --upgrade pip 
    python3 -m pip install ansible 
elif [[ $DIST_ID = "rocky" ]]; then 
    yum install -y ansible-core 
else 
    exit 
fi 
# Ansible Configuration 
# 
# Common configuration 
ansible-playbook -c local -i 127.0.0.1, -b -e 
'ansible_python_interpreter=/usr/bin/python3' ansible
commons.yaml 
# Optional Docker configuration 
if [[ ! -z "${APP_ENABLE_DOCKER}" ]]; then 
    ansible-playbook -c local -i 127.0.0.1, -b -e 
'ansible_python_interpreter=/usr/bin/python3' ansible
docker.yaml 
fi 
# Optional configuration for remote desktop 
if [[ ! -z "${APP_ENABLE_REMOTEDESKTOP}" ]]; then 
    ansible-playbook -c local -i 127.0.0.1, -b -e 
'ansible_python_interpreter=/usr/bin/python3' ansible
remotedesktop.yaml 
fi
