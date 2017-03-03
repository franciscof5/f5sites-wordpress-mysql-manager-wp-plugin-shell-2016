echo "remote database overwritting with local..."
ssh $SSH_USER@$IP "gunzip -fv /tmp/$DATABASENAME-local.sql.gz && mysql -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE  $DATABASENAME < /tmp/$DATABASENAME-local.sql"

