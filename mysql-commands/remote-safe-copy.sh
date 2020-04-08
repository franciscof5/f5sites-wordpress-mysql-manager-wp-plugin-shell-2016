echo "Remote dumping a safe copy of database to: $REMOTE_SAFE_COPY_DIR..."
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE -h $MYSQL_HOST_REMOTE -P $MYSQL_PORT_REMOTE  --lock-tables=false $DATABASENAME | gzip > $REMOTE_SAFE_COPY_DIR/$DATABASENAME-remote-safe-copy.sql.gz"
