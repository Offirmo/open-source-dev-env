#@IgnoreInspection BashAddShebang
[ "$VERBOSE__RC" == true ] && echo "* […open-source-dev-env/…/_01paths.sh] hello! XXX"

#####################
## INIT
## so that the :xyz: test below to work ()
#echo "initial PATH= $PATH"
## ODE stuff is very specific, order shouldn't matter
PATH="~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/bin:$PATH"

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
## https://unix.stackexchange.com/questions/11544/what-is-the-difference-between-opt-and-usr-local

## original Operating system
## (we may want to override them)
pathDoesntContain "/bin"            && export PATH="/bin:$PATH"
pathDoesntContain "/sbin"           && export PATH="/sbin:$PATH"

## packages independent of the OS but ~standardized,
## ex. Macports https://guide.macports.org/#installing.shell
pathDoesntContain "/opt/local/bin"  && export PATH="/opt/local/bin:$PATH"
pathDoesntContain "/opt/local/sbin" && export PATH="/opt/local/sbin:$PATH"

## self, in-house maintained software
pathDoesntContain "/usr/bin"        && export PATH="/usr/bin:$PATH"
pathDoesntContain "/usr/sbin"       && export PATH="/usr/sbin:$PATH"
pathDoesntContain "/usr/local/bin"  && export PATH="/usr/local/bin:$PATH"
pathDoesntContain "/usr/local/sbin" && export PATH="/usr/local/sbin:$PATH"

## ??
pathDoesntContain "~/.local/bin"    && export PATH="~/.local/bin:$PATH"

## ODE stuff
pathDoesntContain "~/work/bin"    && export PATH="~/work/bin:$PATH"


## debug
#echo "final PATH= $PATH"
