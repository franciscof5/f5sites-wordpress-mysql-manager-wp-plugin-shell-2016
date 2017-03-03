if [ "$LAST_ID_LOCAL" == "$LAST_ID_REMOTE" ]; then
	echo "Already synched, nothing to do, quiting..."
	echo "quit"
	POST_IS_AHEAD_IN="NONE"
else 
	DIF=$(($LAST_ID_LOCAL-$LAST_ID_REMOTE))
	#if [ "$LAST_ID_LOCAL" < "$LAST_ID_REMOTE" ]; then
	if [ "$DIF" < 0 ]; then	
		POST_IS_AHEAD_IN="LOCAL"
		echo "Local posts is ahead of remote by $DIF posts, uploading posts to remote server... Do you want to automatic update? (y/n)"
		#source mysql-commands/local-dump-posts.sh
		#source mysql-commands/local-upload-posts.sh
		#source mysql-commands/local-replace-remote-posts.sh
	else
		#DIF=$(($LAST_ID_REMOTE-$LAST_ID_LOCAL))
		POST_IS_AHEAD_IN="REMOTE"
		echo "Remote posts is ahead of local by $DIF posts, downloading posts to local server... Do you want to automatic update? (y/n)"
		
		read PROCEED
		if [ "$PROCEED"=="y" ]; then
			echo "Proceeding with replacement..."
			source mysql-commands-groups/remote-replace-local-posts-exec.sh
			#source mysql-commands/remote-download-posts.sh
			#source mysql-commands/local-safe-copy.sh
			#source mysql-commands/remote-replace-local-posts.sh
		else
			echo "quit"
		fi
		
	fi

fi
