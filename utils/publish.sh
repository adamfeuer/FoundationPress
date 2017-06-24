#!/bin/bash
set -x

npm run package
rm packaged/*;

LOCAL_THEME_PATH=$(cd $( dirname $( dirname `which $0` ) ) ; pwd )
REMOTE_THEME_PATH="/var/www-adamfeuer.com/wp-content/themes"
echo "syncing $LOCAL_THEME_PATH to starcat.io..."
#rsync -av --no-owner --no-perms --no-times --exclude "utils" --exclude ".git" --exclude "node_modules" $LOCAL_THEME_PATH adamfeuer.com:$REMOTE_THEME_PATH
rsync -av --no-owner --exclude "packaged" --exclude "utils" --exclude ".git" --exclude "node_modules" $LOCAL_THEME_PATH adamfeuer.com:$REMOTE_THEME_PATH
ssh adamfeuer.com "sudo chgrp -R www-data $REMOTE_THEME_PATH"
