#!/bin/bash
source mysql-commands/local-dump.sh

source mysql-commands/local-upload-to-remote.sh

source mysql-commands/remote-safe-copy.sh

source mysql-commands/local-replace-remote.sh
