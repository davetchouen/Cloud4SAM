#!/bin/bash

# This script can be used to apply the complete configuration of this Biosphere app to a virtual machine

APP_NAME="test_app_david"
APP_REPO="https://github.com/davetchouen/Cloud4SAM"
APP_DIR="/ifb/apprepo/$APP_NAME"

git clone ${APP_REPO} ${APP_DIR}
cd ${APP_DIR}
source install.sh

# export INSTANCE_HOSTNAME=
source deploy.sh
# echo $APP_URL_SERVICE
