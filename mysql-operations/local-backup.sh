test -d "$LOCAL_BACKUP_DIR" || mkdir -p "$LOCAL_BACKUP_DIR"
echo "1 - Dump all local mysql databases"
echo "2 - Select database"
#echo "3 - Select only prefix tables in database"
echo "Backup Directory: $LOCAL_BACKUP_DIR (change it on config.sh)"
read PROCEED

case "$PROCEED" in
   "1")	echo "Selected 1 - Dumping all copys of local databases to $LOCAL_BACKUP_DIR..."
   exit
	source mysql-operations/local-backup-all-dbs.sh
   ;;
   "2") echo "Selected 2 - Select database" 
   	exit
   	source start.sh
   	OPERATION="local-replace-remote"
   ;;
esac

