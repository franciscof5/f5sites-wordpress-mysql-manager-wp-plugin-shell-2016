echo "importing and replace local data with remote..."
mysql   $DATABASENAME < $LOCAL_TEMP_DIR/$DATABASENAME-"$TABLE_PREFIX"-remote-posts.sql
