#!/bin/bash
  BRANCH_NAME=`git symbolic-ref --short HEAD 2>/dev/null`
  COMMIT="$1"
  echo $COMMIT
  git add -A
  git commit -m "$BRANCH_NAME - $COMMIT"
  git push origin $BRANCH_NAME

  
  export GOOGLE_APPLICATION_CREDENTIALS="/mnt/e/gman-bucket-sa.json"
  gsutil -p angelic-digit-297517 -m rsync -r /mnt/e/reaper_projects gs://gman-music/reaper_projects