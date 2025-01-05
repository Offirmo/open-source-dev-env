#!/usr/bin/env bash
#
# This script does this and that.

set -eu -o pipefail

# Prints a small usage help. This is called on `--help` and on parameter validation errors.
# Syntax follows http://docopt.org/.
usage() {
  cat <<EOF
...
EOF
}

# Foos the bar.
foo() {
  ...
}

main() {
  if [[ "$*" =~ ^(-h|--help)$ ]]; then
    usage
    exit
  fi

  foo

}

main "$@"


##########
## * #!/usr/bin/env bash is more portable than #!/bin/bash
## * add set -eu -o pipefail
## * -e exits on failure of a simple command
## * -u exits on dereference of an undefined variable
## * -o pipefail exists on failures in pipe connected commands
## * put all commands in functions: this makes sure your script fully parses before anything executes;
## * pass all arguments to main()
