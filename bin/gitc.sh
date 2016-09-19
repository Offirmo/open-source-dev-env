#! /bin/bash

REPOSITORY_URL=$1
DEFAULT_DIR="$(echo $(basename "$REPOSITORY_URL") | cut -f 1 -d '.')"
CUSTOM_DIR=$2

if [[ -n "$CUSTOM_DIR" ]]; then
    TARGET_DIR="$CUSTOM_DIR"
else
    TARGET_DIR="$DEFAULT_DIR"
fi


echo "* cloning $REPOSITORY_URL into ~/work/src/${TARGET_DIR}..."

pushd ~/work/src > /dev/null

if [[ ! -d $TARGET_DIR ]]; then
    git clone --recursive "$REPOSITORY_URL" "$TARGET_DIR"
else
    echo "! Already cloned."
fi

popd > /dev/null
