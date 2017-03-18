#!/bin/bash

#echo "dumping master STRUCTURE (localhost $HOSTNAME)..."
#mysqldump -d --no-data --skip-comments --skip-extended-insert $1 > master-sqls/$1-STRUCTURE.sql

NODATA="--no-data --skip-comments --skip-extended-insert"

TABLE="wp_options"

source mysql-commands/local-dump.sh

source mysql-commands/local-extract.sh

source mysql-commands/remote-dump.sh

source mysql-commands/remote-download.sh

source mysql-commands/diff.sh
