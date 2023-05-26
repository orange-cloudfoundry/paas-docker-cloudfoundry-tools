#!/bin/bash
readonly base_dir_dir="$(realpath $0|xargs dirname)"
GIT_REPO="$base_dir_dir"
LOG_LEVEL="${LOG_LEVEL:-debug}"
if [ -z "$GITHUB_COM_TOKEN" ];then
  echo -e "WARNING: missing GitHub token to allow. Please set it before running this script, using \n export GITHUB_COM_TOKEN=\"xxx\""
  sleep 1
fi
#if [ "$GIT_REPO" = "." ]; then
#  GIT_REPO="$PWD"
#fi
echo "Log level: $LOG_LEVEL"
echo "Git repo volume path: $GIT_REPO"
docker run \
    --rm \
    -e LOG_LEVEL="$LOG_LEVEL" \
    -e GITHUB_COM_TOKEN="$GITHUB_COM_TOKEN" \
    -v "$GIT_REPO:/tmp/local-git-repo" \
    --workdir /tmp/local-git-repo \
    ghcr.io/renovatebot/renovate \
    --platform=local \
    --semantic-commits=disabled
#    --dry-run="true" \
    #    -v "$base_dir_dir/config.js:/usr/src/app/config.js" \
