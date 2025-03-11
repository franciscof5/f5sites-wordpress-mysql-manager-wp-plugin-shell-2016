echo "Connecting to remote server for last post id remote..."
LAST_ID_REMOTE=$(ssh $SSH_USER@$IP "mysql fnetwork      -se 'SELECT ID FROM $POSTS_TABLE ORDER BY ID DESC LIMIT 1'")
echo "REMOTE last post id: $LAST_ID_REMOTE"
