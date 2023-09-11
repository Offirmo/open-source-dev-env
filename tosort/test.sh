#!/bin/sh
set -e

TARGET_FILE="hello.sh"

LINE="# Offirmo settings"
if ! grep -q "${LINE}" ${TARGET_FILE}; then
	{
		echo ""
		echo "${LINE}"  # comment
		echo "echo \"installed!\""   ## another comment
		echo ""
		echo ""
	} >> "${TARGET_FILE}"

	echo "New settings have been installed"
else
	echo "Setting already up to date"
fi
