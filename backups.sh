#!/bin/bash

echo "hello there (general kenobi) and welcome to the gman backups"

echo "taking git backup"
  BRANCH_NAME=`git symbolic-ref --short HEAD 2>/dev/null`
  COMMIT="$1"
  echo $COMMIT
  git add -A
  git commit -m "$BRANCH_NAME - $COMMIT"
  git push origin $BRANCH_NAME
echo "git backup is done. now taking audio files backup"
  
  export GOOGLE_APPLICATION_CREDENTIALS="/mnt/e/gman-bucket-sa.json"
  gsutil -m rsync -r /mnt/e/reaper_projects gs://gman-music/reaper_projects

echo "all backups, done"