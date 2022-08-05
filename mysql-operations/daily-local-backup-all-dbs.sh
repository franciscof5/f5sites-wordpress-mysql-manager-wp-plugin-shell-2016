test -d "$LOCAL_BACKUP_DIR" || mkdir -p "$LOCAL_BACKUP_DIR"

test -d "$LOCAL_BACKUP_DIR/d-0" || mkdir -p "$LOCAL_BACKUP_DIR/d-0"
test -d "$LOCAL_BACKUP_DIR/d-1" || mkdir -p "$LOCAL_BACKUP_DIR/d-1"
test -d "$LOCAL_BACKUP_DIR/d-2" || mkdir -p "$LOCAL_BACKUP_DIR/d-2"

rm -rf "$LOCAL_BACKUP_DIR/d-2"
mv "$LOCAL_BACKUP_DIR/d-1" "$LOCAL_BACKUP_DIR/d-2"
mv "$LOCAL_BACKUP_DIR/d-0" "$LOCAL_BACKUP_DIR/d-1"
test -d "$LOCAL_BACKUP_DIR/d-0" || mkdir -p "$LOCAL_BACKUP_DIR/d-0"

#echo "Do you want to execute a copy of all local mysql databases to: $LOCAL_BACKUP_DIR. Tip (y/n)"
#read PROCEED
#if [ "$PROCEED" = "y" ]; then
	echo "Dumping all copys of local databases to $LOCAL_BACKUP_DIR/d-0 ..."
	# Get the database list, exclude information_schema
	for db in $(mysql -B -s -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL  -P $MYSQL_PORT_LOCAL -e 'show databases' | grep -v information_schema)
	do
	  # dump each database in a separate file
	  mysqldump -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL  -P $MYSQL_PORT_LOCAL --lock-tables=false "$db" | gzip > "$LOCAL_BACKUP_DIR/d-0/$db.sql.gz"
	done
	echo -e "Subject: daily backup on prod (linod) \n\n operation successfull at ($date) at $hostname" | ssmtp -v fmatelli@gmail.com
#else
	exit
#fi



