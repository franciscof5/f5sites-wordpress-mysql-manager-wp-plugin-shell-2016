echo "Downloading and extracting set of tables from database..."
test -d "$LOCAL_TEMP_DIR" || mkdir -p "$LOCAL_TEMP_DIR"
scp $SSH_USER@$IP:$REMOTE_TEMP_DIR/$DATABASENAME-"$TABLE_PREFIX"remote-posts.sql.gz $LOCAL_TEMP_DIR/$DATABASENAME-"$TABLE_PREFIX"remote-posts.sql.gz
gunzip -fv $LOCAL_TEMP_DIR/$DATABASENAME-remote-posts.sql.gz 
