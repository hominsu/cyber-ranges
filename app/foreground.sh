#!/bin/bash
set -eo pipefail

/etc/init.d/mysql start
/usr/sbin/apache2ctl -D FOREGROUND "$@"