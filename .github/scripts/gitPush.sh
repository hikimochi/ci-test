#!/bin/bash
set -eu
GIT_BIN=/usr/bin/git
echo '1'

$GIT_BIN config --global user.email "you@example.com"
$GIT_BIN config --global user.name "Your Name"

$GIT_BIN fetch --prune
echo '2'
$GIT_BIN checkout -B "$TARGET_BRANCH" origin/"$TARGET_BRANCH"
echo '3'
$GIT_BIN merge "$SOURCE_BRANCH"
remote_repo="https://${GITHUB_ACTOR}:${GITHUB_API_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
echo '4'
$GIT_BIN push "$remote_repo" HEAD:"$TARGET_BRANCH"