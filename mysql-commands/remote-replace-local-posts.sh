echo "importing and replace local data with remote..."
mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL $DATABASENAME < /tmp/$DATABASENAME-"$TABLE_PREFIX"posts.sql
