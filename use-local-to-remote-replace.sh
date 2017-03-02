#!/bin/bash

echo "Sync WordPress databases across servers"

source mysql-saudations/start.sh

source mysql-commands/load-config.sh

source mysql-prompts/get-database-name.sh

source mysql-commands/local-dump.sh

source mysql-commands/local-upload-to-remote.sh

source mysql-commands/remote-safe-copy.sh

source mysql-commands/local-replace-remote.sh

source mysql-saudations/end.sh
