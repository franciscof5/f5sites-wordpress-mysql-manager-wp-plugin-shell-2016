echo "backuping remote database..."
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE --lock-tables=false $DATABASENAME | gzip > /tmp/$DATABASENAME-remote-safe-copy.sql.gz"
