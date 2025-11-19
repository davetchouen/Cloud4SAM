#!/bin/bash

# This script is executed on the virtual machine during the Installation phase (need to be ran as root!).
# It is used to record a predefined VM-image of the appliance.
# Otherwise executed first during a cloud deployement in IFB-Biosphere

LOCUSER='ubuntu'

# General deps
apt-get update
apt-get install -y


# execution de la recette ansible
ansible-playbook -c local -i localhost, appliance.yml 
