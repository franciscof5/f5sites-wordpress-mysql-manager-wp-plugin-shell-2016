#!/bin/bash
echo "Tip what service you want to execute?"
echo "1 - Sync ALL tables"
echo "2 - Sync posts tables (posts, postmeta, categories...)"
read SERVICENUMBER

if [ "$SERVICENUMBER" -eq 1 ]; then
	echo "Service 1 selected, replacing remote db with local, no complementes"
	#source mysql-commands-groups/local-replace-remote.sh
	SERVICECOMPLEMENT=""
else
	echo "Service 2 selected, replacing local db with remote, specific complement added"
	#source mysql-commands-groups/local-replace-remote-posts.sh
	SERVICECOMPLEMENT="-posts"
fi
