echo "uploading database..."
scp /tmp/$DATABASENAME-local.sql.gz $SSH_USER@$IP:/tmp/$DATABASENAME-local.sql.gz 

