echo "remote-download-d-0"
echo "rm -rf $LOCAL_TEMP_DIR/d-0"
echo "scp -r $SSH_USER@$IP:"$REMOTE_BACKUP_DIR/d-0" $LOCAL_TEMP_DIR/"
rm -rf $LOCAL_TEMP_DIR/d-0
echo "scp -r $SSH_USER@$IP:"$REMOTE_BACKUP_DIR/d-0" $LOCAL_TEMP_DIR/"
scp -r $SSH_USER@$IP:"$REMOTE_BACKUP_DIR/d-0" $LOCAL_TEMP_DIR/
rm -rf $LOCAL_TEMP_DIR/d-0/mysql.sql.gz
rm -rf $LOCAL_TEMP_DIR/d-0/sys.sql.gz
rm -rf $LOCAL_TEMP_DIR/d-0/performance_schema.sql.gz
echo "gunzip -fv $LOCAL_TEMP_DIR/d-0/*"
gunzip -fv $LOCAL_TEMP_DIR/d-0/*
echo "cd $LOCAL_TEMP_DIR/d-0"
cd $LOCAL_TEMP_DIR/d-0
echo "for f in $LOCAL_TEMP_DIR/d-0/* ; do"
for f in * ; do 
	echo "Importing < $f";
	echo "mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL -P $MYSQL_PORT_LOCAL";
	mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL -P $MYSQL_PORT_LOCAL "${f:0:-4}" < $f
done

echo "that is it"
notify-send "Backup ok"
echo -e "Subject: remote replace local note-lg \n\n operation successfull at ($date) at $hostname" | ssmtp -v fmatelli@gmail.com
# ssmtp -v fmatelli@gmail.com 

#scp $SSH_USER@$IP:$REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz $REMOTE_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz
#gunzip -fv $LOCAL_TEMP_DIR/$DATABASENAME$TABLES_SELECTED-remote.sql.gz 
