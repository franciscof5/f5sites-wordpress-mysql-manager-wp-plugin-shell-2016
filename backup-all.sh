#!/bin/bash

source mysql-saudations/start.sh

echo "Backup All MySQL local database"

source mysql-commands/load-config.sh

source mysql-commands/backup-all-dbs.sh
