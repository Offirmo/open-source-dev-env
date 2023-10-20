#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: $(basename "${BASH_SOURCE}")"
echo "# \$BASH_SOURCE = $BASH_SOURCE"
echo "# revision = circa 2023"
echo "#########################"

## safety  (https://serverfault.com/a/500778)
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## debug informations
echo "* environment diagnostic:"
echo "  - BASH          = '$BASH' (should equal /bin/bash)"
echo "  - BASH_SUBSHELL = $BASH_SUBSHELL"
echo "  - whoami        = `whoami`"
echo "  - pwd           = `pwd`"
echo "  - LANG          = `echo $LANG`"
echo "  - LC_ALL        = `echo $LC_ALL`"
## full env
#echo "  - PATH          = $PATH"
#env
############################################################
echo "* starting…"

echo "******* installing base apps through brew…"

brew install --cask inkscape

brew install ffmpeg yt-dlp

if [ ! -f ~/.config/yt-dlp/config ]; then
	echo "* creating ytdl config file: ~/.config/yt-dlp/config"
	{
		echo '# https://github.com/yt-dlp/yt-dlp/#configuration'
		echo '--split-chapters'
		echo '--format bestaudio[ext=mp3]/bestaudio[ext=m4a]/bestaudio'
		echo '--output ~/Downloads/ytdl/%(release_date)s-%(id)s-%(title)s.%(ext)s'
		echo '--output chapter:~/Downloads/ytdl/%(channel)s/[%(id)s]-%(title)s/%(section_title)s.%(ext)s'
	} >> ~/.config/yt-dlp/config
fi

# TODO REVIEW doesn't seem it's recommended way
#brew install audacity

#############################################################
echo "* …all done ✅"
