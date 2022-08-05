#!/bin/bash
source mysql-commands/remote-dump.sh

source mysql-commands/remote-download.sh

if [ $IGNORE_LOCAL_SAFE_BACKUP -eq "0" ];then
	source mysql-commands/local-safe-copy.sh
fi
source mysql-commands/remote-replace-local.sh
