#!/bin/bash
set -eu

echo "$GITHUB_REPOSITORY"
HTTP_STATUS=`curl -s -H "Accept: application/vnd.github.luke-cage-preview+json" \
  -H "Authorization: token ${GITHUB_API_TOKEN}" \
  https://api.github.com/repos"$GITHUB_REPOSITORY"/branches/"$TARGET_BRANCH"/protection \
  -X PUT -d @"$JSON" \
  -o /dev/null -w %{http_code}`
echo $HTTP_STATUS