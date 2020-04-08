REMOTE_BACKUP_DIR=/backup
echo "Remote server check $REMOTE_BACKUP_DIR..."
ssh $SSH_USER@$IP 'test -d "$REMOTE_BACKUP_DIR" || mkdir -p "$REMOTE_BACKUP_DIR"'

echo "Dumping all copys of local databases to $REMOTE_BACKUP_DIR..."
# Get the database list, exclude information_schema
#ssh $SSH_USER@$IP "for db in $(mysql -B -s -u $MYSQL_USER_REMOTE --password=$MYSQL_PASS_REMOTE -h $MYSQL_HOST_REMOTE -P $MYSQL_PORT_REMOTE  -e 'show databases' | grep -v information_schema)
#do
#mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE -h $MYSQL_HOST_REMOTE -P $MYSQL_PORT_REMOTE  --lock-tables=false '$db' | gzip > '$REMOTE_BACKUP_DIR/$db.sql.gz'
#done"
