#!/bin/bash
echo "What operation you need?"
echo "1 - Auto Sync between wordpress servers checking for highest post ID"
echo "2 - Local to Remote replace database"
echo "3 - Remote to Local replace database"
read OPERATION

if [ "$OPERATION" -eq 1 ];then
	echo "1 Selected"
	source "use-auto-sync-posts.sh"
else 
	if [ "$OPERATION" -eq 2 ];then
		echo "2 selected"
		source "use-local-to-remote-replace.sh"
	else 
		if [ "$OPERATION" -eq 3 ];then
			echo "3 selected"
			source "use-remote-to-local.sh"
		fi
	fi
fi
