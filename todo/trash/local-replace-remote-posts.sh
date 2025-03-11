echo "remote database overwritting with local..."
ssh $SSH_USER@$IP "gunzip -fv $LOCAL_TEMP_DIR/$DATABASENAME-local-posts.sql.gz && mysql    $DATABASENAME < $REMOTE_TEMP_DIR/$DATABASENAME-local-posts.sql"

