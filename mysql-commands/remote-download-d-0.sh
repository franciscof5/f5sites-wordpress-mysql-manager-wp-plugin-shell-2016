echo "remote-download-d-0"
echo "rm -rf $LOCAL_TEMP_DIR/d-0"
echo "scp -r $SSH_USER@$IP:"$REMOTE_BACKUP_DIR/d-0" $LOCAL_TEMP_DIR/"
rm -rf $LOCAL_TEMP_DIR/d-0
echo "scp -r $SSH_USER@$IP:"$REMOTE_BACKUP_DIR/d-0" $LOCAL_TEMP_DIR/"
scp -r $SSH_USER@$IP:"$REMOTE_BACKUP_DIR/d-0" $LOCAL_TEMP_DIR/
if [ -e $LOCAL_TEMP_DIR/d-0/mysql.sql.gz ]
then
	rm -rf $LOCAL_TEMP_DIR/d-0/mysql.sql.gz
	rm -rf $LOCAL_TEMP_DIR/d-0/sys.sql.gz
	rm -rf $LOCAL_TEMP_DIR/d-0/performance_schema.sql.gz
	rm -rf $LOCAL_BACKUP_DIR/d-2
	mv $LOCAL_BACKUP_DIR/d-1 $LOCAL_BACKUP_DIR/d-2
	mv $LOCAL_BACKUP_DIR/d-0 $LOCAL_BACKUP_DIR/d-1
	rm -rf $LOCAL_BACKUP_DIR/d-0
	mkdir $LOCAL_BACKUP_DIR/d-0
	cp -r * $LOCAL_BACKUP_DIR/d-0
	echo "gunzip -fv $LOCAL_TEMP_DIR/d-0/*"
	gunzip -fv $LOCAL_TEMP_DIR/d-0/*
	echo "cd $LOCAL_TEMP_DIR/d-0"
	cd $LOCAL_TEMP_DIR/d-0
	echo "for f in $LOCAL_TEMP_DIR/d-0/* ; do"
	for f in * ; do 
		echo "Importing < $f";
		echo "mysql    ";
		mysql     "${f:0:-4}" < $f
	done
	echo "that is it"
	notify-send "Backup ok"
	echo -e "Subject: remote replace local note-lg \n\n operation successfull at ($date) at $hostname" | ssmtp -v fmatelli@gmail.com
else
    echo "Warning: no mysql.sql.gz found, maybe an error downloading the d-0 backup file from remote host (timedout probably)"
fi
# ssmtp -v fmatelli@gmail.com 

#scp $SSH_USER@$IP:$REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz $REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz
#gunzip -fv $LOCAL_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz 
