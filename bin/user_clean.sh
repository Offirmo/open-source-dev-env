#! /bin/bash

############ cleanups ############

rm -rf ~/.npm-pkgr/
rm -rf ~/.npm_lazy
rm -rf ~/.npm
yarn cache clean
npm cache clean --force

nvm ls


# rmdir /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/com.apple.CoreSimulator.SimDevice.*
# find /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T -type d -name "com.apple.CoreSimulator.SimDevice.*" -exec rm -r {} +

# rm -d /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/com.apple.CoreSimulator.SimDevice.*
# rm -d /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/ssh-*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/yarn--15919215*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/yarn--1591921*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/yarn--*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/*.log
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/SourceTreeTemp.*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/.com.insomnia*
# rm -R /private/var/folders/97/bcm58dhj7wl6fxgq5kv5vsj00000gp/T/.org.efounders*
