echo "Remote dumping a safe copy of database to: $REMOTE_SAFE_COPY_DIR..."
ssh $SSH_USER@$IP "mysqldump      --lock-tables=false $DATABASENAME | gzip > $REMOTE_SAFE_COPY_DIR/$DATABASENAME-remote-safe-copy.sql.gz"
