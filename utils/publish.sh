#!/bin/bash
set -x
LOCAL_THEME_PATH=$(cd ../$( dirname `which $0` ); pwd )
REMOTE_THEME_PATH="/var/www-adamfeuer.com/wp-content/themes/starcat-foundationpress"
echo "syncing $THEME_PATH to starcat.io..."
#rsync -av --no-owner --no-perms --no-times --exclude "utils" --exclude ".git" --exclude "node_modules" $LOCAL_THEME_PATH adamfeuer.com:$REMOTE_THEME_PATH
rsync -av --no-owner --exclude "utils" --exclude ".git" --exclude "node_modules" $LOCAL_THEME_PATH adamfeuer.com:$REMOTE_THEME_PATH
ssh adamfeuer.com "sudo chgrp -R www-data $REMOTE_THEME_PATH"
