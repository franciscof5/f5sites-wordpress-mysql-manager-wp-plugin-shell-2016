echo "Dumping a copy of local database to $LOCAL_TEMP_DIR..."
mysqldump   --lock-tables=false --add-drop-database --default-character-set=utf8 --compatible=mysql4,no_table_options $DATABASENAME "$TABLE_PREFIX"posts "$TABLE_PREFIX"postmeta "$TABLE_PREFIX"termmeta "$TABLE_PREFIX"terms "$TABLE_PREFIX"term_relationships "$TABLE_PREFIX"term_taxonomy  | gzip -v > $LOCAL_TEMP_DIR/$DATABASENAME-local-posts.sql.gz
#REMOVED --databases from query, it was: mysqldump   --lock-tables=false --databases --add-drop-database --default-character-set=utf8 --compatible=mysql4,no_table_options $DATABASENAME $TABLE_SELECTED | gzip -v > $LOCAL_TEMP_DIR/$DATABASENAME-local.sql.gz


