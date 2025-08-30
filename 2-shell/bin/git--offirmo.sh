#! /bin/bash

if [ "$IS_OFFIRMO_DEV_ENV" = 1 ]; then
	git config user.email     "offirmo.net@gmail.com"
	git config user.name      "Offirmo"

	npm set init-author-email "offirmo.net@gmail.com"
	npm set init-author-name  "Offirmo"
	npm set init-license      "Unlicense"
else
	echo "(Not in Offirmo dev env, NOT setting Offirmo identity & settings)"
fi
