#!/bin/bash

# This script is executed on the virtual machine during the *Deployment* phase.
# It is used to apply parameters specific to the current deployment.
# It is executed secondly during a cloud deployement in IFB-Biosphere,
# after the *Installation* phase.

# Application parameters :
# INSTANCE_HOSTNAME (in): VM hostname or IP address got from the cloud broker
# APP_VERSION (in): Rocker stack to use as define in github.com/rocker-org/rocker-versioned2
# APP_URL_SERVICE (out): URL of services to push to the cloud broker

# General parameters
source /etc/profile.d/ifb.sh

# REPET - Import docker image
#docker pull urgi/docker_vre_aio:v3.0

# RepeatModeler - Import docker image
# - [RepeatModeler](http://www.repeatmasker.org/RepeatModeler)
# - [Dfam TE Tools Container](https://github.com/Dfam-consortium/TETools)
#docker pull dfam/tetools:latest

## mise en place des locales en français
locale-gen --purge fr_LU.UTF-8


 echo -e 'LANG="fr_LU.UTF-8"' > /etc/default/locale
