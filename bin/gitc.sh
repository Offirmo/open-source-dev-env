#! /bin/bash

REPOSITORY_URL=$1
CUSTOM_REPO_DIR=$2

DEFAULT_PARENT_DIR=~/work/src
DEFAULT_REPO_DIR="$(basename "$REPOSITORY_URL")"
DEFAULT_REPO_DIR=${DEFAULT_REPO_DIR%".git"}

PARENT_DIR="$DEFAULT_PARENT_DIR"

if [[ -n "$CUSTOM_REPO_DIR" ]]; then
    TARGET_DIR="$CUSTOM_REPO_DIR"
else
    TARGET_DIR="$DEFAULT_REPO_DIR"
fi


echo "* cloning $REPOSITORY_URL into ${PARENT_DIR}/${TARGET_DIR}..."

pushd $PARENT_DIR > /dev/null

if [[ ! -d $TARGET_DIR ]]; then
    git clone --recursive "$REPOSITORY_URL" "$TARGET_DIR"
else
    echo "! Already cloned."
fi

popd > /dev/null
