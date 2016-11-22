#!/bin/bash
echo "F5 SITES Mysql Manager, Backup All MySQL local database"
echo "Hi, $USER"

# Configuration file
echo "Load configuration file. (to change settings open config.sh)"
source config.sh

test -d "$BACKUP_DIR" || mkdir -p "$BACKUP_DIR"

echo "Dumping all copys of local databases to $BACKUP_DIR..."
# Get the database list, exclude information_schema
for db in $(mysql -B -s -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL -e 'show databases' | grep -v information_schema)
do
  # dump each database in a separate file
  mysqldump -u $MYSQL_USER_LOCAL --password=$MYSQL_PASS_LOCAL --lock-tables=false "$db" | gzip > "$BACKUP_DIR/$db.sql.gz"
done

echo "Dumping complete"
echo "backup-all.sh ended."
echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"
