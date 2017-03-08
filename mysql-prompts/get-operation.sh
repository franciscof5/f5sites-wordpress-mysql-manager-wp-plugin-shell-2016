#!/bin/bash
echo "What operation you need?"
echo "1 - Auto Sync between wordpress POSTS by checking for highest post ID"
echo "2 - Local to Remote replace database"
echo "3 - Remote to Local replace database"
read OPERATION

if [ "$OPERATION" -eq 1 ];then
	echo "1 Selected"
	OPERATION="auto-sync"
else 
	if [ "$OPERATION" -eq 2 ];then
		echo "2 selected"
		OPERATION="local-replace-remote"
	else 
		if [ "$OPERATION" -eq 3 ];then
			echo "3 selected"
			OPERATION="remote-replace-local"
		fi
	fi
fi
