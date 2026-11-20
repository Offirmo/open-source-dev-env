#! /bin/bash
## Shell provision script

echo "#########################"
echo "# NON root provisioning script: echo${BASH_SOURCE[0]}"
echo "# revision = circa 2026/07"
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
echo "  - PERSONAL_USERNAME__GITHUB = ${PERSONAL_USERNAME__GITHUB:-(unset)}"
############################################################
## shared
prompt_to_register_public_key() {
  local public_key_path="$1"
  echo "please add your new key $public_key_path to GitHub & similar:"
  open_url https://github.com/settings/keys
  open_url https://bitbucket.org/account/settings/ssh-keys/
  if [[ "$OSTYPE" == darwin* ]]; then
    echo "cat $public_key_path | pbcopy"
  else
    echo "cat $public_key_path | xclip -selection clipboard"
  fi
}

open_url() {
  if [[ "$OSTYPE" == darwin* ]]; then
    open "$1"
  elif command -v xdg-open &> /dev/null; then
    xdg-open "$1"
  else
    echo "  ↳ please open: $1"
  fi
}

file_has_line() {
  local file="$1"
  local line="$2"
  grep --quiet --line-regexp --fixed-strings "$line" "$file"
}

## for lines written into config files: portable across machines/usernames
shorten_home_path() {
  local full_path="$1"
  case "$full_path" in
    "$HOME")   printf '%s\n' '~' ;;
    "$HOME"/*) printf '%s\n' "~${full_path#"$HOME"}" ;;
    *)         printf '%s\n' "$full_path" ;;
  esac
}

############################################################
echo "* starting ▶️"

## generate if missing
mkdir -p "$HOME/.ssh"

if [ -f "$HOME/.ssh/config" ]; then
	echo "* $HOME/.ssh/config already exists ✅"
else
	echo "" >> "$HOME/.ssh/config"
fi
if [ -f "$HOME/.ssh/known_hosts" ]; then
	echo "* $HOME/.ssh/known_hosts already exists ✅"
else
	echo "* creating $HOME/.ssh/known_hosts ▶️"
	echo "" >> "$HOME/.ssh/known_hosts"
fi
if [ -f "$HOME/.ssh/authorized_keys" ]; then
	echo "* $HOME/.ssh/authorized_keys already exists ✅"
else
	echo "* creating $HOME/.ssh/authorized_keys ▶️"
	echo "" >> "$HOME/.ssh/authorized_keys"
fi

if [ -f "$HOME/.ssh/id_ed25519.pub" ]; then
	echo "* $HOME/.ssh/id_ed25519.pub already exists ✅"
else
	echo "* creating $HOME/.ssh/id_ed25519.pub ▶️"
	## 100 rounds: https://crypto.stackexchange.com/a/40902
	ssh-keygen -a 100 -t ed25519 -C "$USER" -f "$HOME/.ssh/id_ed25519"
	sleep 1
	prompt_to_register_public_key "$HOME/.ssh/id_ed25519.pub"
fi

if [ -f "$HOME/.ssh/id_ed25519_offirmo.pub" ]; then
	echo "* $HOME/.ssh/id_ed25519_offirmo.pub already exists ✅"
else
	echo "* creating $HOME/.ssh/id_ed25519_offirmo.pub ▶️"
	ssh-keygen -a 100 -t ed25519 -C "offirmo.net@gmail.com" -f "$HOME/.ssh/id_ed25519_offirmo"
	sleep 1
	prompt_to_register_public_key "$HOME/.ssh/id_ed25519_offirmo.pub"

	if ! file_has_line "$HOME/.ssh/config" "Host offirmo.github.com"; then
		{
			echo ""
			echo "Host offirmo.github.com"
			echo "   HostName github.com"
			echo "   User git"
			echo "   IdentityFile $(shorten_home_path "$HOME/.ssh/id_ed25519_offirmo")"
			echo "   IdentitiesOnly yes"
			echo ""
		} >> "$HOME/.ssh/config"
	fi
fi

if [[ -z "$PERSONAL_USERNAME__GITHUB" ]]; then
	echo "* reminder to set \$PERSONAL_USERNAME__GITHUB to your personal GitHub username"
elif [[ "$(tr '[:upper:]' '[:lower:]' <<< "$PERSONAL_USERNAME__GITHUB")" == "offirmo" ]]; then
	ALREADY_DONE=1
else
	TARGET="$HOME/.ssh/id_ed25519_$PERSONAL_USERNAME__GITHUB"
	if [ -f "$TARGET.pub" ]; then
		echo "* $TARGET already exists ✅"
	else
		echo "* creating $TARGET ▶️"
		ssh-keygen -a 100 -t ed25519 -C "$PERSONAL_USERNAME__GITHUB" -f "$TARGET"
		sleep 1
		prompt_to_register_public_key "$TARGET.pub"

		if ! file_has_line "$HOME/.ssh/config" "Host $PERSONAL_USERNAME__GITHUB.github.com"; then
			{
				echo ""
				echo "Host $PERSONAL_USERNAME__GITHUB.github.com"
				echo "   HostName github.com"
				echo "   User git"
				echo "   IdentityFile $(shorten_home_path "$TARGET")"
				echo "   IdentitiesOnly yes"
				echo ""
			} >> "$HOME/.ssh/config"
		fi
	fi
fi


## ensure most restrictive permissions
## this is checked by some tools which will refuse to work if incorrect
## https://gist.github.com/grenade/6318301
chmod 700 "$HOME/.ssh"
## most restrictive permissions for private keys
## note: be careful to discriminate folders & files! (seen an employer creating a folder here)
## (find -exec: no-op if nothing matches, safe with spaces)
find "$HOME/.ssh" -mindepth 1 -type f -exec chmod 600 {} +
find "$HOME/.ssh" -mindepth 1 -type d -exec chmod 700 {} +
# TODO review the 3 below
#chmod 644 "$HOME/.ssh/config"
#chmod 644 "$HOME/.ssh/known_hosts"
#chmod 644 "$HOME/.ssh/authorized_keys"
## slightly less strict for public
find "$HOME/.ssh" -maxdepth 1 -type f -name '*.pub' -exec chmod 644 {} +
echo "* $HOME/.ssh permissions ✅"

############################################################
echo "* …all done ✅"
