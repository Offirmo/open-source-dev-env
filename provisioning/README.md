
- the scripts should strive to be self-contained, since they can be called remotely
- the 0## scripts are the bootstrap to run remotely. After that, the other should be run locally

- 000 = bootstrap until downloaded this repo
- 100 = base install post-bootstrap, from local
- 200 = ordinary most necessary tools
- 300 = dev env
- 400 = creator
- 900 = gaming


TODO IMPROVE adding to bash_profiles* only if the line is not already here

HOWTO:
```bash
if [ ! command -v brew > /dev/null]; then
	...
fi

seen in /etc/bashrc on macOS = test if interactive
if [ -z "$PS1" ]; then
   return
fi

Also seen:
if [ -z "$INSIDE_EMACS" ]; then



# ...If you customize PROMPT_COMMAND
# be sure to include the previous value. e.g.,
#
#   PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }your_code_here"
#   PROMPT_COMMAND="your_code_here${PROMPT_COMMAND:+; $PROMPT_COMMAND}")
HOWEVER iterm2 uses a better technique!
if [[ -n "$PROMPT_COMMAND" ]]; then
    PROMPT_COMMAND+=$'\n'
fi;
PROMPT_COMMAND+='__iterm2_prompt_command'

Also seen:
if [ "${BASH-no}" != "no" ]; then
        [ -r /etc/bashrc ] && . /etc/bashrc
fi


if ! grep -q "${HEADER}" "${TARGET_FILE}"; then
	{
		echo ""
		echo "${HEADER}"
		echo "..."
	} >> "${TARGET_FILE}"


if [ -n "$PS1" ]; then export VERBOSE__RC=true fi



[[ "$VERBOSE__RC" == true ]] && echo "* hello from: /etc/bashrc"
```
