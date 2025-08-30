#! /bin/bash

## Clone a git repo in the appropriate folder.
## clones can be with ssh or https:
## - https is not inherently worse than ssh https://stackoverflow.com/questions/11041729/git-clone-with-https-or-ssh-remote
## - GitHub gives an https link ex. https://github.com/Offirmo/offirmo-monorepo.git
## - bitbucket auths better with an SSH url
## - (from some private doc) "Whenever possible, HTTPS authentication is preferred over SSH because it’s faster and more portable"

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
# then get n-1 segment, which may includes git@github.com: so we tr
TEMP="$(basename "$(echo "$TEMP" | tr ':' '/')")"
POSSIBLE_USER_OR_ORG_LC=$(echo "$TEMP" | tr '[:upper:]' '[:lower:]')

## debug
echo "INPUT:"
echo "  BASH_SOURCE = $BASH_SOURCE"
echo "  BASH_VERSION              = $BASH_VERSION"
echo "  1                         = $1"
echo "  2                         = $2"
echo "  REPOSITORY_URL            = $REPOSITORY_URL"
echo "  LAST_URL_SEGMENT          = $LAST_URL_SEGMENT"
echo "  DEFAULT_REPO_DIR          = $DEFAULT_REPO_DIR"
echo "  DEFAULT_PARENT_DIR        = $DEFAULT_PARENT_DIR"
echo "  POSSIBLE_USER_OR_ORG_LC   = $POSSIBLE_USER_OR_ORG_LC"
echo "  PERSONAL_USERNAME__GITHUB = $PERSONAL_USERNAME__GITHUB"
echo "  IS_OFFIRMO_DEV_ENV        = $IS_OFFIRMO_DEV_ENV"


## detect for special handling
IS_FROM_OFFIRMO=0
IS_FROM_PERSONAL=0
case $POSSIBLE_USER_OR_ORG_LC in
	*offirmo )
		IS_FROM_OFFIRMO=1
		;;
	*online-adventures )
		IS_FROM_OFFIRMO=1
		;;
	*offirmo-team )
		IS_FROM_OFFIRMO=1
		;;
	*offirmo-graveyard )
		IS_FROM_OFFIRMO=1
		;;
	*)
		if [ -n "$PERSONAL_USERNAME__GITHUB" ] && [ "$POSSIBLE_USER_OR_ORG_LC" = "$PERSONAL_USERNAME__GITHUB" ]; then
			IS_FROM_PERSONAL=1
		fi
		;;
esac


## branch to dedicated SSH keys if needed
if [ "$IS_FROM_OFFIRMO" = 1 ] && [ "$IS_OFFIRMO_DEV_ENV" = 1 ]; then
	## for pro/perso reasons, we have different SSH keys, requiring a domain tweak (see ~/.ssh/config)
	echo "Offirmo detected! Tweaking the URL..."
	REPOSITORY_URL="git@offirmo.github.com:$POSSIBLE_USER_OR_ORG_LC/$LAST_URL_SEGMENT"
fi
if [ "$IS_FROM_PERSONAL" = 1 ]; then
	## for pro/perso reasons, we have different SSH keys, requiring a domain tweak (see ~/.ssh/config)
	echo "Personal username detected! Tweaking the URL..."
	REPOSITORY_URL="git@$PERSONAL_USERNAME__GITHUB.github.com:$POSSIBLE_USER_OR_ORG_LC/$LAST_URL_SEGMENT"
fi

## structure the target directory for better FS organization
if [ -n "$COMPANY_DOMAIN" ]; then
	if [ "$IS_FROM_OFFIRMO" = 1 ] || [ "$IS_FROM_PERSONAL" = 1 ]; then
		## let's clearly separate
		PARENT_DIR=$PARENT_DIR/x-external
	fi
	if [ "$IS_FROM_PERSONAL" = 1 ]; then
		## recognized in some jurisdictions
		PARENT_DIR=$PARENT_DIR/private
	fi
fi
if [ "$IS_FROM_OFFIRMO" = 1 ]; then
	## further grouping
	PARENT_DIR=$PARENT_DIR/offirmo-x
fi
## grouping by org or user
PARENT_DIR=$PARENT_DIR/$POSSIBLE_USER_OR_ORG_LC

if [[ -n "$CUSTOM_REPO_DIR" ]]; then
	TARGET_DIR="$CUSTOM_REPO_DIR"
else
	TARGET_DIR="$DEFAULT_REPO_DIR"
fi


## debug
echo "OUTPUT:"
echo "  IS_FROM_OFFIRMO  = $IS_FROM_OFFIRMO"
echo "  IS_FROM_PERSONAL = $IS_FROM_PERSONAL"
echo "  REPOSITORY_URL   = $REPOSITORY_URL"
echo "  PARENT_DIR       = $PARENT_DIR"
echo "  TARGET_DIR       = $TARGET_DIR"

echo "* cloning $REPOSITORY_URL into ${PARENT_DIR}/${TARGET_DIR} ..."

mkdir -p $PARENT_DIR
pushd $PARENT_DIR > /dev/null

if [[ -d $TARGET_DIR ]]; then
	echo "! Already cloned."
else
	## --single-branch  cf. https://stackoverflow.com/questions/1778088/how-do-i-clone-a-single-branch-in-git
	export GIT_LFS_SKIP_SMUDGE=1 ## https://gitlab.ub.uni-giessen.de/jlugitlab/git-lfs-howto#option-prevent-download-of-lfs-files
	git clone --recursive --recurse-submodules --single-branch "$REPOSITORY_URL" "$TARGET_DIR"

	if [ $IS_FROM_OFFIRMO = 1 ]; then
		## fix config

		pushd $TARGET_DIR > /dev/null
		git config remote.origin.fetch +refs/heads/*:refs/remotes/origin/*

		echo ""                                 >> ".git/config"
		echo "[user]"                           >> ".git/config"
		echo "	email = offirmo.net@gmail.com" >> ".git/config"
		echo "	name = Offirmo"                >> ".git/config"
		echo "[github]"                         >> ".git/config"
		echo "	user = Offirmo"                >> ".git/config"
		# my recommended choices
		echo "[pull]"                           >> ".git/config"
		echo "	rebase = true"                 >> ".git/config"
		echo "[push]"                           >> ".git/config"
		echo "	default = simple"              >> ".git/config"
		echo ""                                 >> ".git/config"

		popd > /dev/null
	elif [ $IS_FROM_PERSONAL = 1 ]; then
		## fix config

		pushd $TARGET_DIR > /dev/null
		git config remote.origin.fetch +refs/heads/*:refs/remotes/origin/*

		echo ""                                     >> ".git/config"
		echo "[github]"                             >> ".git/config"
		echo "	user = $PERSONAL_USERNAME__GITHUB" >> ".git/config"
		# my recommended choices
		echo "[pull]"                               >> ".git/config"
		echo "	rebase = true"                     >> ".git/config"
		echo "[push]"                               >> ".git/config"
		echo "	default = simple"                  >> ".git/config"
		echo ""                                     >> ".git/config"

		popd > /dev/null
	else
		## assuming we're in "big company" mode where we don't want to pull all the branches by default
		echo "cloned in single branch mode! If you want all branches: git config remote.origin.fetch +refs/heads/*:refs/remotes/origin/*"
	fi
fi

popd > /dev/null
