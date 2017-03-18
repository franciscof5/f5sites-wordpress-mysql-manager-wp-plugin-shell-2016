#!/bin/bash
echo "What operation you need?"
echo "1 - Auto Sync - Check for highest post ID"
echo "2 - Local to Remote - Replace database"
echo "3 - Remote to Local - Replace database"
echo "4 - Compare Content - From table inside databases"
echo "5 - Compare Structure - From table inside databases"
echo "8 - Local Backup - Dump to a backup folder"
echo "9 - Quit - exit F5 Sites WordPress MySQL Manager"
read OPERATION

case "$OPERATION" in
   "1") echo "Selected 1 - Auto Sync" 
   	OPERATION="auto-sync"
   ;;
   "2") echo "Selected 2 - Local to Remote" 
   	OPERATION="local-replace-remote"
   	#source mysql-prompts/get-tables-complement.sh
   ;;
   "3") echo "Selected 3 - Remote to Local" 
   	OPERATION="remote-replace-local"
   	#source mysql-prompts/get-tables-complement.sh
   ;;
   "4") echo "Selected 4 - Compare content" 
   	OPERATION="compare-content"
   	#source mysql-prompts/get-tables-complement.sh
   	#source mysql-prompts/get-table.sh
   	#source mysql-prompts/get-service-complement.sh
   ;;
   "5") echo "Selected 5 - Compare structure" 
   	OPERATION="compare-structure"
   ;;
   "8") echo "Selected 8 - Local backup all(dump)" 
	#source mysql-prompts/get-server.sh
	echo "1 - All database zipped to a folder"
	echo "2 - Enter detailed instructions"
	read DIRECT
	if [ "$DIRECT" = "1" ]; then
		source mysql-commands/local-backup-all-dbs.sh
		#exit
	else
	   	OPERATION="local-backup"
	fi
   	#source mysql-commands/local-backup-all-dbs.sh
   	#source start.sh
   ;;
   "9") echo "quiting..." 
   	source mysql-saudations/end.sh
   	exit
   ;;
esac

