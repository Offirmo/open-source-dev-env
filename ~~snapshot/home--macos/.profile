## user-wide profile for sh(1)
## may (should) also be sourced by other shells
[ "$VERBOSE__RC" = true ] && echo "$(date +%H:%M:%S)   ↳ [~/.profile] hello!" >&2

## Customizations = this machine/person only
#export PERSONAL_USERNAME__GITHUB=Foo
#export COMPANY="foo"
#export COMPANY_DOMAIN="$COMPANY.com"
#export COMPANY_USERNAME__GITHUB="xxx-$COMPANY"
#export COMPANY_ORG1__GITHUB="$COMPANY"
#export COMPANY_ORG2__GITHUB="$COMPANY-alt"

## (shared defaults = ODE 2-shell/_.profile.sh, will be sourced below once the ODE repo is cloned)

if [ -f ~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/_.profile.sh ]; then . ~/work/src/x-external/off/offirmo/open-source-dev-env/2-shell/_.profile.sh; fi
