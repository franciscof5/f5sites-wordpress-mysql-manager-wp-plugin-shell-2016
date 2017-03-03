echo "importing and replace local data with remote..."
mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL $DATABASENAME < $LOCAL_TEMP_DIR/$DATABASENAME-"$TABLE_PREFIX"posts.sql
