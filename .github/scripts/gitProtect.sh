#!/bin/bash
set -eu

echo "$GITHUB_REPOSITORY"
curl -s -H -o /dev/null -w %{http_code} "Accept: application/vnd.github.luke-cage-preview+json" \
  -H "Authorization: token ${GITHUB_API_TOKEN}" \
  https://api.github.com/repos"$GITHUB_REPOSITORY"/branches/"$TARGET_BRANCH"/protection \
  -X PUT -d @"$JSON"