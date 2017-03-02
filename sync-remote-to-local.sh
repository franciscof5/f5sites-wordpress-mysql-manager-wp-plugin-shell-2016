#!/bin/bash

source mysql-prompts/saudation.sh

echo "Sync Remote to Local"

source mysql-commands/load-config.sh

source mysql-prompts/end.sh

echo "sync-local-to-remote.sh ended."

