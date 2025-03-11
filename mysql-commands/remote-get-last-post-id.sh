echo "Connecting to remote server for last post id remote database: $DATABASENAME, posts tables: $POSTS_TABLE..."
LAST_ID_REMOTE=$(ssh $SSH_USER@$IP "mysql $DATABASENAME      -se 'SELECT ID FROM "$TABLE_PREFIX"posts ORDER BY ID DESC LIMIT 1'")
echo "REMOTE last post id: $LAST_ID_REMOTE"
