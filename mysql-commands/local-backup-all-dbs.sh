test -d "$LOCAL_BACKUP_DIR" || mkdir -p "$LOCAL_BACKUP_DIR"

echo "Dumping all copys of local databases to $LOCAL_BACKUP_DIR..."
# Get the database list, exclude information_schema
for db in $(mysql -B -s -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL -e 'show databases' | grep -v information_schema)
do
  # dump each database in a separate file
  mysqldump -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL --lock-tables=false "$db" | gzip > "$LOCAL_BACKUP_DIR/$db.sql.gz"
done
