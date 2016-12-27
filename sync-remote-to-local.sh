#!/bin/bash
echo $(date)
echo "2F5 SITES Mysql Manager, Remote Sync Remote to Local (linux to linux)"
echo "For custom use don't forget to manually open the script and manually change ssh and mysql users, passwds and ips (and options like --add-drop-database and --lock-tables)"
echo "Hi, $USER"

echo "What database you want to sync? Write database name and hit enter"
echo "Please hit enter for fnetwok database, or tip database name"
read DATABASENAME

if [ "$DATABASENAME"=="" ]; then
echo "Using default fnetwork database"
DATABASENAME="fnetwork"
fi

# Configuration file
echo "Load configuration file... (to change settings open config.sh)"
source config.sh

echo "connecting to a remote server to dump a copy of a database..."
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE --lock-tables=false  --databases --add-drop-database --compatible=no_table_options --default-character-set=utf8 $DATABASENAME | gzip > /tmp/$DATABASENAME-remote.sql.gz"

echo "downloading and extracting database..."
scp $SSH_USER@$IP:/tmp/$DATABASENAME-remote.sql.gz /tmp/$DATABASENAME-remote.sql.gz
gunzip -fv /tmp/$DATABASENAME-remote.sql.gz 

echo "dumping a safety copy from local database..."
mysqldump -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL --lock-tables=false --databases --add-drop-database --compatible=mysql4,no_table_options --default-character-set=utf8 $DATABASENAME | gzip -v > /tmp/$DATABASENAME-local-safe-copy.sql.gz

echo "importing and replace local data with remote..."
mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL $DATABASENAME < /tmp/$DATABASENAME-remote.sql

echo "sync-local-to-remote.sh ended."
echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"
