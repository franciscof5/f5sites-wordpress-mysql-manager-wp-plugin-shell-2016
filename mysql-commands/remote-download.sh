echo "Downloading and extracting database to: $LOCAL_TEMP_DIR..."
scp $SSH_USER@$IP:$REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz $REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz
gunzip -fv $LOCAL_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz 
