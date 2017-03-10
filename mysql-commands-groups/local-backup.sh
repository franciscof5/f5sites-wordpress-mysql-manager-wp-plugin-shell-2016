echo "Do you want to execute a copy of all local mysql databases to: $LOCAL_BACKUP_DIR. Tip (y/n)"
read PROCEED
if [ "$PROCEED" = "y" ]; then
	source mysql-commands/local-backup-all-dbs.sh
else
	exit
fi

