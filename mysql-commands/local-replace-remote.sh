echo "Remote database overwritting with local $DATABASENAME tables $TABLES_SELECTED in $LOCAL_TEMP_DIR, unziping file $REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-local.sql.gz..."
ssh $SSH_USER@$IP "gunzip -fv $REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-local.sql.gz && mysql      $DATABASENAME < $REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-local.sql"

