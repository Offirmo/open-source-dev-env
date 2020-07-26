#! /bin/bash
git config user.email `whoami`@atlassian.com
git config user.name `whoami`

npm set init.author.email `whoami`@atlassian.com
npm set init.author.name `whoami`
npm set init.license "unlicensed"
