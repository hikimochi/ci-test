#!/bin/bash
set -eu

HTTP_STATUS=`curl -s -H "Accept: application/vnd.github.luke-cage-preview+json" \
  -H "Authorization: token ${GITHUB_API_TOKEN}" \
  https://api.github.com/repos/"$GITHUB_REPOSITORY"/branches/"$TARGET_BRANCH"/protection \
  -X PUT -d @"$JSON" \
  -o /tmp/curl.log -w %{http_code}`

if [ ${HTTP_STATUS} -eq 200 ]; then
    cat /tmp/curl.log
else
    cat /tmp/curl.log
    exit 1
fi