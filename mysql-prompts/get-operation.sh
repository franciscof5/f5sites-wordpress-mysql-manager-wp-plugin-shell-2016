#!/bin/bash
echo "What operation you need?"
echo "1 - Auto Sync - check for highest post ID"
echo "2 - Local to Remote - replace database"
echo "3 - Remote to Local - replace database"
echo "4 - Compare Content - from table inside databases"
echo "5 - Compare Structure - from table inside databases"
echo "8 - Local Backup All - mysqldump all db zipped to folder"
echo "9 - Quit - exit F5 Sites WordPress MySQL Manager"
read OPERATION

case "$OPERATION" in
   "1") echo "selected 1 Auto Sync" 
   	OPERATION="auto-sync"
   ;;
   "2") echo "selected 2 Local to Remote" 
   	OPERATION="local-replace-remote"
   	#source mysql-prompts/get-tables-complement.sh
   ;;
   "3") echo "selected 3 Remote to Local" 
   	OPERATION="remote-replace-local"
   	#source mysql-prompts/get-tables-complement.sh
   ;;
   "4") echo "selected 4 Compare content" 
   	OPERATION="compare-content"
   	#source mysql-prompts/get-tables-complement.sh
   	#source mysql-prompts/get-table.sh
   	#source mysql-prompts/get-service-complement.sh
   ;;
   "5") echo "selected 5 Compare structure" 
   	OPERATION="compare-structure"
   ;;
   "8") echo "selected 8 Local backup all(dump)" 
	#source mysql-prompts/get-server.sh
   	#OPERATION="local-backup"
   	source mysql-commands/local-backup-all-dbs.sh
   	source start.sh
   ;;
   "9") echo "quiting..." 
   	source mysql-saudations/end.sh
   	exit
   ;;
esac

