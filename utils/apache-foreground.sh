#!/bin/bash
set -eo pipefail

/usr/sbin/apache2ctl -D FOREGROUND "$@"