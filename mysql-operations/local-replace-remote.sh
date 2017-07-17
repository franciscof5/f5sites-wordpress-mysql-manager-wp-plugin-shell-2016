#!/bin/bash
#source mysql-commands-group/get-extra-details.sh

source mysql-commands/local-dump.sh

source mysql-commands/local-upload.sh

if [ $IGNORE_REMOTE_SAFE_BACKUP -eq "0" ];then
	source mysql-commands/remote-safe-copy.sh
fi

source mysql-commands/local-replace-remote.sh
