#! /bin/bash

if [ -n "$COMPANY_DOMAIN" ]; then
	echo "(No COMPANY_DOMAIN, NOT setting identity)"
else
	git config user.email     `whoami`@$COMPANY_DOMAIN
	git config user.name      `whoami`

	npm set init-author-email `whoami`@$COMPANY_DOMAIN
	npm set init-author-name  `whoami`
fi
