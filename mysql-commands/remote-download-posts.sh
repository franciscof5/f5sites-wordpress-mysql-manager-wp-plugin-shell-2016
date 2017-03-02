echo "Downloading and extracting set of tables from database..."
scp $SSH_USER@$IP:/tmp/$DATABASENAME-"$TABLE_PREFIX"posts.sql.gz /tmp/$DATABASENAME-"$TABLE_PREFIX"posts.sql.gz
gunzip -fv /tmp/$DATABASENAME-"$TABLE_PREFIX"posts.sql.gz 
