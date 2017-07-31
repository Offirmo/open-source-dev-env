#! /bin/bash

REPOSITORY_URL=$1
CUSTOM_REPO_DIR=$2

# strips trailing / if any
REPOSITORY_URL=${REPOSITORY_URL%"/"}

DEFAULT_PARENT_DIR=~/work/src
LAST_URL_SEGMENT="$(basename "$REPOSITORY_URL")"
DEFAULT_REPO_DIR=${LAST_URL_SEGMENT%".git"}

PARENT_DIR="$DEFAULT_PARENT_DIR"
# strips last segment from the full url
TEMP=${REPOSITORY_URL%"/$LAST_URL_SEGMENT"}
# then get n-1 segment
TEMP="$(basename "$TEMP")"

# if recognized as an expected subdir, change parent dir
if [[ $TEMP = "offirmo" ]]; then
    PARENT_DIR=$PARENT_DIR/off
elif [[ $TEMP = "online-adventures" ]]; then
    PARENT_DIR=$PARENT_DIR/oa
fi

if [[ -n "$CUSTOM_REPO_DIR" ]]; then
    TARGET_DIR="$CUSTOM_REPO_DIR"
else
    TARGET_DIR="$DEFAULT_REPO_DIR"
fi


echo "* cloning $REPOSITORY_URL into ${PARENT_DIR}/${TARGET_DIR}..."

mkdir -p $PARENT_DIR
pushd $PARENT_DIR > /dev/null

if [[ ! -d $TARGET_DIR ]]; then
    git clone --recursive "$REPOSITORY_URL" "$TARGET_DIR"
else
    echo "! Already cloned."
fi

popd > /dev/null
