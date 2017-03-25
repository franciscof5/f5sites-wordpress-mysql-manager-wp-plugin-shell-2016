echo "Extracting $LOCAL_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-local.sql.gz"
gunzip -fv $LOCAL_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-local.sql.gz
#REMOVED --databases from query, it was: mysqldump -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL --lock-tables=false --databases --add-drop-database --default-character-set=utf8 --compatible=mysql4,no_table_options $DATABASENAME $TABLE_SELECTED | gzip -v > $LOCAL_TEMP_DIR/$DATABASENAME-local.sql.gz


