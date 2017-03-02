#if ["$LAST_ID_LOCAL"="$LAST_ID_REMOTE"];
if [ "$LAST_ID_LOCAL" == "$LAST_ID_REMOTE" ]; then
	echo "Already synched, nothing to do, quiting..."
	echo "quit"
	POST_IS_AHEAD_IN="NONE"
else 
	if [ "$LAST_ID_LOCAL" < "$LAST_ID_REMOTE" ]; then
		DIF=$(($LAST_ID_LOCAL-$LAST_ID_REMOTE))
		POST_IS_AHEAD_IN="LOCAL"
		echo "Local posts is ahead of remote by $DIF posts, uploading posts to remote server..."
		#echo "WARNING, ALL DATABASE WILL BE SYNCHED (not only posts)..."
		#source sync-local-to-remote.sh
		source mysql-commands/local-to-remote-sync-posts.sh
	else
		DIF=$(($LAST_ID_REMOTE-$LAST_ID_LOCAL))
		echo "Remote posts is ahead of local by $DIF posts, downloading posts to local server..."
		POST_IS_AHEAD_IN="REMOTE"
		source  mysql-commands/remote-to-local-sync-posts.sh
		#echo "WARNING, ALL DATABASE WILL BE SYNCHED (not only posts)..."
		#source sync-posts-remote-to-local.sh
		#source sync-remote-to-local.sh
	fi

fi
