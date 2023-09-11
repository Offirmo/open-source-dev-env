#@IgnoreInspection BashAddShebang

echo "* hello from: …open-source-dev-env/shellrc/_01paths.sh"

pathDoesntContain() {
	case $PATH in
		*:$1:*) return 1;; # note the :xyz: to avoid
		*) return 0;;
	esac
}


#####################
## our own stuff
## 🥲🥲🥲 HACK that we add before and after for the :xyz: test below to work ()
PATH="$PATH:~/work/bin"
PATH="~/work/src/off/open-source-dev-env/bin:$PATH"

#####################
## generic
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
