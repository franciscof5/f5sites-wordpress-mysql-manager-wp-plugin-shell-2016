#
# Password moved for security
# file my.cnf
# edit and move to ~/.my.cnf
# chmod 600 ~/.my.cnf
#

# better solution to use ssh-copy-id
SSH_USER=""
SSH_PASS=""
IP="1.1.1.1"
#
LOCAL_BACKUP_DIR=/backup
LOCAL_TEMP_DIR=/tmp
LOCAL_SAFE_COPY_DIR=/backup
REMOTE_BACKUP_DIR=/backup
REMOTE_TEMP_DIR=/tmp
REMOTE_SAFE_COPY_DIR=/backup
#
DEFAULT_DATABASE="wordpress"
DETAULT_TABLE_PREFIX="wp_"
#
IGNORE_LOCAL_SAFE_BACKUP=0
IGNORE_REMOTE_SAFE_BACKUP=0
# mysdump option, comment to remove option when dumping https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html
LOCKTABLES=" --lock-tables=false "
DATABASES=" --databases"
DROPDB=" --add-drop-database "
CARACHTER=" --default-character-set=utf8 "
COMPA_M4=" --compatible=mysql4 "
COMPA_NT=" --compatible=no_table_options"
