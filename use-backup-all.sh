#!/bin/bash

source mysql-saudations/start.sh

echo "Backup All MySQL local database"

source mysql-commands/load-config.sh

source mysql-commands/local-backup-all-dbs.sh

#source mysql-commands/remote-backup-all-dbs.sh
