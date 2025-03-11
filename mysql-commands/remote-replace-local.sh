echo "Local importing remote database $DATABASENAME tables $TABLES_SELECTED in $LOCAL_TEMP_DIR..."
mysql     $DATABASENAME < $LOCAL_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql
