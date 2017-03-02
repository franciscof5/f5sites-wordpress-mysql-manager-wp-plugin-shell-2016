#!/bin/bash

source mysql-saudations/start.sh
echo "Sync WordPress Posts Tables across databases servers"

source mysql-commands/load-config.sh

source mysql-prompts/get-database-name.sh

source mysql-prompts/get-table-prefix.sh

source mysql-commands/generate-tables.sh

source mysql-commands/local-get-last-post-id.sh

source mysql-commands/remote-get-last-post-id.sh

source mysql-commands/compare-post-ids.sh

#echo $POST_IS_AHEAD_IN
#source mysql-commands/local-to-remote-sync-posts.sh
#source mysql-commands/remote-to-local-sync-posts.sh

source mysql-saudations/end.sh

