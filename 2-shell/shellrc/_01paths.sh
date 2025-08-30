#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_01paths.sh] hello!"

#####################
## our own stuff
## 🥲🥲🥲 HACK that we add before and after for the :xyz: test below to work ()
PATH="$PATH:~/work/bin"
PATH="~/work/src/off/open-source-dev-env/2-shell/bin:$PATH"

pathDoesntContain() {
	case $PATH in
		*:$1:*) return 1;; # note the :xyz: to avoid
		*) return 0;;
	esac
}

#####################
## specific bins
## -> see _sub_tools.sh

#####################
## generic bins
## This is important bc some tools install there and expect to be picked up

## references
## https://linux.slashdot.org/story/23/12/24/221229/a-proposed-change-for-fedora-40-unify-usrbin-with-usrsbin
## https://news.ycombinator.com/item?id=31336396

## in reverse order of importance
pathDoesntContain "~/.local/bin"    && export PATH="~/.local/bin:$PATH"
pathDoesntContain "/usr/local/bin"  && export PATH="/usr/local/bin:$PATH"
pathDoesntContain "/usr/local/sbin" && export PATH="/usr/local/sbin:$PATH"
pathDoesntContain "/usr/bin"        && export PATH="/usr/bin:$PATH"
pathDoesntContain "/usr/sbin"       && export PATH="/usr/sbin:$PATH"
pathDoesntContain "/bin"            && export PATH="/bin:$PATH"
pathDoesntContain "/sbin"           && export PATH="/sbin:$PATH"

## debug echo "\"$PATH\".split(\":\")"
