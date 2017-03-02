echo "backuping remote database and overwritting it with local..."
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE --lock-tables=false $DATABASENAME | gzip > /tmp/$DATABASENAME-remote-safe-copy.sql.gz && gunzip -fv /tmp/$DATABASENAME-local.sql.gz && mysql -u $MYSQL_USER_REMOTE  -p$MYSQL_PASS_REMOTE  $DATABASENAME < /tmp/$DATABASENAME-local.sql"
