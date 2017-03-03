#!/bin/bash

echo "Sync WordPress databases across servers"

source mysql-saudations/start.sh

source mysql-commands/load-config.sh

source mysql-prompts/get-database-name.sh

source mysql-prompts/get-table-prefix.sh

echo "Tip what service you want to execute?"
echo "1 - Sync ALL tables"
echo "2 - Sync posts tables (posts, postmeta, categories...)"
read SERVICENUMBER

if [ "$SERVICENUMBER" -eq 1 ]; then
	echo "Service 1 selected, replacing remote db with local"
	source mysql-commands-groups/local-replace-remote.sh
else
	echo "Service 2 selected, replacing local db with remote"
	source mysql-commands-groups/local-replace-remote-posts.sh
fi

source mysql-saudations/end.sh
