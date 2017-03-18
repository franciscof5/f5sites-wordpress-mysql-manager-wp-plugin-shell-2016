#!/bin/bash
#source mysql-commands-group/get-extra-details.sh

source mysql-commands/local-dump.sh

source mysql-commands/local-upload.sh

source mysql-commands/remote-safe-copy.sh

source mysql-commands/local-replace-remote.sh
