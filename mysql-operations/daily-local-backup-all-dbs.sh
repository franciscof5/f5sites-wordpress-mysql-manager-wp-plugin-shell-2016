test -d "$LOCAL_BACKUP_DIR" || mkdir -p "$LOCAL_BACKUP_DIR"

test -d "$LOCAL_BACKUP_DIR/d-0" || mkdir -p "$LOCAL_BACKUP_DIR/d-0"
test -d "$LOCAL_BACKUP_DIR/d-1" || mkdir -p "$LOCAL_BACKUP_DIR/d-1"
test -d "$LOCAL_BACKUP_DIR/d-2" || mkdir -p "$LOCAL_BACKUP_DIR/d-2"

rm -rf "$LOCAL_BACKUP_DIR/d-2"
mv "$LOCAL_BACKUP_DIR/d-1" "$LOCAL_BACKUP_DIR/d-2"
mv "$LOCAL_BACKUP_DIR/d-0" "$LOCAL_BACKUP_DIR/d-1"
test -d "$LOCAL_BACKUP_DIR/d-0" || mkdir -p "$LOCAL_BACKUP_DIR/d-0"

echo "Dumping all copys of local databases to $LOCAL_BACKUP_DIR/d-0 ..."
# Get the database list, exclude information_schema
for db in $(mysql -B -s -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL  -P $MYSQL_PORT_LOCAL -e 'show databases' | grep -v information_schema)
do
	# dump each database in a separate file
	echo "Backing up: $db ..."

	#para Innodb (atual, 2025)
	mysqldump -u "$MYSQL_USER_LOCAL" --password="$MYSQL_PASS_LOCAL" -h "$MYSQL_HOST_LOCAL" -P "$MYSQL_PORT_LOCAL" --single-transaction --quick --max-allowed-packet=512M "$db" | pigz > "$LOCAL_BACKUP_DIR/d-0/$db.sql.gz"
	
	#para MyIsan (old)
	#mysqldump -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL  -P $MYSQL_PORT_LOCAL --lock-tables=false "$db" | gzip > "$LOCAL_BACKUP_DIR/d-0/$db.sql.gz"

	# Limitar para no máximo 4 backups simultâneos
    while [ "$(jobs | wc -l)" -ge 4 ]; do
        sleep 1
    done
done

# Aguardar todos os processos terminarem
wait

echo -e "Subject: Daily Backup on Prod (Linode)\n\nOperation successful at $(date) on $(hostname)" | ssmtp -v fmatelli@gmail.com

echo "Backup completed successfully."

exit



