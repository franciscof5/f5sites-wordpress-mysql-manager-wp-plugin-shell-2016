echo "uploading database..."
scp $LOCAL_TEMP_DIR/$DATABASENAME-local-posts.sql.gz $SSH_USER@$IP:$REMOTE_TEMP_DIR/$DATABASENAME-local-posts.sql.gz 

