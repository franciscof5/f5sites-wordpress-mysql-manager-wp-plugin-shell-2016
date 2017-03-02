#!/bin/bash

source mysql-saudations/start.sh

echo "Sync Remote to Local"

source mysql-commands/load-config.sh

source mysql-prompts/get-database-name.sh

source mysql-prompts/get-table-prefix.sh

source mysql-commands/generate-tables.sh

source mysql-saudations/end.sh

echo "sync-local-to-remote.sh ended."

