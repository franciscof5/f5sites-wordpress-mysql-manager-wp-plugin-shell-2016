#!/bin/bash
echo "F5 SITES Mysql Manager, Remote Sync Local to Remote (linux to linux)"
echo "For custom use don't forget to manually open the script and manually change ssh and mysql users, passwds and ips (and options like --add-drop-database and --lock-tables)"
echo "Hi, $USER"

echo "What database you want to sync? Write database name and hit enter"
read DATABASENAME

# Configuration file
echo "Load configuration file. (to change settings open config.sh)"
source config.sh

echo "dumping a copy of local database..."
mysqldump -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL --lock-tables=false --databases --add-drop-database --compatible=mysql4,no_table_options --default-character-set=utf8 $DATABASENAME | gzip -v > /tmp/$DATABASENAME-local.sql.gz

echo "uploading database..."
scp /tmp/$DATABASENAME-local.sql.gz $SSH_USER@$IP:/tmp/$DATABASENAME-local.sql.gz 

echo "backuping remote database and overwritting it with local..."
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE --lock-tables=false $DATABASENAME | gzip > /tmp/$DATABASENAME-remote-safe-copy.sql.gz && gunzip -fv /tmp/$DATABASENAME-local.sql.gz && mysql -u $MYSQL_USER_REMOTE  -p$MYSQL_PASS_REMOTE  $DATABASENAME < /tmp/$DATABASENAME-local.sql"

echo "sync-local-to-remote.sh ended."
echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"
