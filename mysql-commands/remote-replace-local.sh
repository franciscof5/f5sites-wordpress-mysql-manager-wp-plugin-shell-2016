echo "LOCAL SERVER: importing remote database $DATABASENAME..."
mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL $DATABASENAME < /tmp/$DATABASENAME-remote.sql
