#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2023"
echo "#########################"

if [ "$EUID" -eq 0 ]; then
	echo "* should NOT be run as root ❌"
	exit 1
fi

## predictable output of tools (english messages, code-point sorting = same on macOS and Linux)
## C.UTF-8 = the only UTF-8 locale available on both (en_US.UTF-8 may not be generated on Linux)
export LANG=C.UTF-8 LC_ALL=C.UTF-8

echo "* environment diagnostic:"
echo "  - bash = $BASH $BASH_VERSION, SHLVL = $SHLVL, stdin = $([ -t 0 ] && echo tty || echo 'not a tty (piped?)')"
echo "  - user = $(whoami), HOME = $HOME"
echo "  - OS   = $(uname -sm) ($([[ "$OSTYPE" == darwin* ]] && echo "macOS $(sw_vers -productVersion)" || ( . /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" )))"
echo "  - brew = $(command -v brew || echo '(not found)')"
echo "  - XDG_CONFIG_HOME = ${XDG_CONFIG_HOME:-(unset)}"
############################################################
## XDG base dirs = the spec defaults when unset or empty
## https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
## NOT exported: no change for child processes (some tools behave differently when set, ex. nvm's installer)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

############################################################
echo "* starting…"

echo "******* installing base apps through brew…"

brew install inkscape

brew install ffmpeg libdvdcss yt-dlp

if [ ! -f "$XDG_CONFIG_HOME/yt-dlp/config" ]; then
	echo "* creating ytdl config file: $XDG_CONFIG_HOME/yt-dlp/config"
	mkdir -p "$XDG_CONFIG_HOME/yt-dlp"
	{
		echo '# https://github.com/yt-dlp/yt-dlp/#configuration'
		echo '--split-chapters'
		echo '--format bestaudio[ext=mp3]/bestaudio[ext=m4a]/bestaudio'
		echo '--output ~/Downloads/ytdl/%(release_date)s-%(id)s-%(title)s.%(ext)s'
		echo '--output chapter:~/Downloads/ytdl/%(channel)s/[%(id)s]-%(title)s/%(section_title)s.%(ext)s'
	} >> "$XDG_CONFIG_HOME/yt-dlp/config"
fi

if ! compgen -G "/usr/local/lib/libdvdcss*" > /dev/null; then
	## from Google, for nol VLC tools such as handbrake
	sudo mkdir -p /usr/local/lib
	sudo cp -a /opt/homebrew/lib/libdvdcss* /usr/local/lib/
fi

# TODO REVIEW doesn't seem it's the recommended way
#brew install audacity

#############################################################
echo "* …all done ✅"
