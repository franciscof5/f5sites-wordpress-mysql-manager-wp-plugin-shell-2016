echo "REMOTE SERVER: downloading and extracting database..."
scp $SSH_USER@$IP:/tmp/$DATABASENAME-remote.sql.gz /tmp/$DATABASENAME-remote.sql.gz
gunzip -fv /tmp/$DATABASENAME-remote.sql.gz 
