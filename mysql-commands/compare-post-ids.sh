if [ "$LAST_ID_LOCAL" == "$LAST_ID_REMOTE" ]; then
	echo "#################################################"
	echo "Already same highest ID nothing to do, quiting..."
	echo "#################################################"
	echo "It does not means it is synched, the content from servers db tables can be different, we only compare highest IDs number"
	#echo "quit"
	POST_IS_AHEAD_IN="NONE"
	source start.sh
else 
	DIF=$(($LAST_ID_LOCAL-$LAST_ID_REMOTE))
	#if [ "$LAST_ID_LOCAL" < "$LAST_ID_REMOTE" ]; then
	if [ "$DIF" < 0 ]; then	
		POST_IS_AHEAD_IN="LOCAL"
		echo "Local posts is ahead of remote by $DIF posts, uploading posts to remote server... Do you want to automatic update? (y/n)"
		
		read PROCEED
		if [ "$PROCEED" = "y" ]; then
			echo "Proceeding with replacement..."
			source mysql-operations/local-replace-remote.sh
			#source mysql-commands/remote-download-posts.sh
			#source mysql-commands/local-safe-copy.sh
			#source mysql-commands/remote-replace-local-posts.sh
		else
			#echo "quit"
			source start.sh
		fi
		#source mysql-commands/local-dump-posts.sh
		#source mysql-commands/local-upload-posts.sh
		#source mysql-commands/local-replace-remote-posts.sh
	else
		#DIF=$(($LAST_ID_REMOTE-$LAST_ID_LOCAL))
		POST_IS_AHEAD_IN="REMOTE"
		DIF=${DIF#-}
		echo "Remote posts is ahead of local by $DIF posts, downloading posts to local server... Do you want to automatic update? (y/n)"
		
		read PROCEED
		if [ "$PROCEED" = "y" ]; then
			echo "Proceeding with replacement..."
			source mysql-operations/remote-replace-local.sh
			#source mysql-commands/remote-download-posts.sh
			#source mysql-commands/local-safe-copy.sh
			#source mysql-commands/remote-replace-local-posts.sh
		else
			#echo "quit"
			source start.sh
		fi
		
	fi

fi
