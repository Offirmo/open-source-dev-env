#! /bin/bash

## expects a HTTPS web url rather than SSH

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
echo "TEMP = $TEMP"
if [[ $TEMP = "Offirmo" ]]; then
    PARENT_DIR=$PARENT_DIR/off
elif [[ $TEMP = "online-adventures" ]]; then
    PARENT_DIR=$PARENT_DIR/oa
elif [[ $TEMP = "Offirmo-team" ]]; then
    PARENT_DIR=$PARENT_DIR/offirmo-team
elif [[ $TEMP = "Offirmo-graveyard" ]]; then
    PARENT_DIR=$PARENT_DIR/offirmo-graveyard
elif [[ $TEMP = "CYEF" ]]; then
    PARENT_DIR=$PARENT_DIR/cyef
fi

if [[ -n "$CUSTOM_REPO_DIR" ]]; then
    TARGET_DIR="$CUSTOM_REPO_DIR"
else
    TARGET_DIR="$DEFAULT_REPO_DIR"
fi


echo "* cloning $REPOSITORY_URL into ${PARENT_DIR}/${TARGET_DIR} ..."

mkdir -p $PARENT_DIR
pushd $PARENT_DIR > /dev/null

if [[ ! -d $TARGET_DIR ]]; then
    git clone --recursive --recurse-submodules "$REPOSITORY_URL" "$TARGET_DIR"
else
    echo "! Already cloned."
fi

popd > /dev/null
