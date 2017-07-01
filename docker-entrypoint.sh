#!/bin/bash

set -e

umask u+rxw,g+rwx,o-rwx

export PATH="$HOME/.yarn/bin:$PATH"

exec "$@"
