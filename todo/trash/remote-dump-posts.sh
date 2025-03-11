echo "Dumping remote copy of $DATABASENAME tables with prefix $TABLE_PREFIX to: $REMOTE_TEMP_DIR"
ssh $SSH_USER@$IP "mysqldump   --lock-tables=false  --add-drop-database --compatible=mysql4,no_table_options --default-character-set=utf8 $DATABASENAME '$TABLE_PREFIX'posts '$TABLE_PREFIX'postmeta '$TABLE_PREFIX'termmeta '$TABLE_PREFIX'terms '$TABLE_PREFIX'term_relationships '$TABLE_PREFIX'term_taxonomy | gzip > $REMOTE_TEMP_DIR/$DATABASENAME-'$TABLE_PREFIX'-remote-posts.sql.gz"
