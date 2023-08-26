#! /bin/bash

git config user.email     `whoami`@$COMPANY_DOMAIN
git config user.name      `whoami`

npm set init-author-email `whoami`@$COMPANY_DOMAIN
npm set init-author-name  `whoami`
npm set init-license      "unlicensed"
