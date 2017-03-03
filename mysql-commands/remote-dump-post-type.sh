echo "Dumping remote copy of $DATABASENAME tables with prefix $TABLE_PREFIX"
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE --lock-tables=false  --add-drop-database --compatible=mysql4,no_table_options --default-character-set=utf8 $DATABASENAME f5sites_posts f5sites_postmeta f5sites_termmeta f5sites_terms f5sites_term_relationships f5sites_term_taxonomy | gzip > /tmp/$DATABASENAME-f5sites_posts.sql.gz"

#mysql -e "select * from myTable" -u myuser -pxxxxxxxx mydatabase > mydumpfile.txt
