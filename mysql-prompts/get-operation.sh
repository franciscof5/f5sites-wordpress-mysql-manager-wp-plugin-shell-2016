#!/bin/bash
echo "What operation you need?"
echo " AUTO"
echo "1 - Auto Sync - Check for highest post ID"
echo " MANUAL"
echo "2 - Local to Remote - Replace database"
echo "3 - Remote to Local - Replace database"
echo " COMPARE"
echo "4 - Compare Content - From table inside databases"
echo "5 - Compare Structure - From table inside databases"
echo " BACKUP"
echo "7 - Local Export - Dump to a backup folder"
#echo "8 - Remote Export and Download - (in development)"
echo "QUIT"
echo "9 - Quit - exit F5 Sites WordPress MySQL Manager"
echo "TEST CONNECTION"
echo "10 - Remote test - SSH connection & MySQL connection"
echo "11 - Local test - MySQL connection"
read OPERATION

case "$OPERATION" in
   "1") echo "Selected 1 - Auto Sync" 
   	OPERATION="auto-sync"
   ;;
   "2") echo "Selected 2 - Local to Remote" 
   	OPERATION="local-replace-remote"
   ;;
   "3") echo "Selected 3 - Remote to Local" 
   	OPERATION="remote-replace-local"
   ;;
   "4") echo "Selected 4 - Compare content" 
   	OPERATION="compare-content"
   ;;
   "5") echo "Selected 5 - Compare structure" 
   	OPERATION="compare-structure"
   ;;
   "7") echo "Selected 8 - Local backup all(dump)" 
	echo "1 - Quick export all database zipped to a folder"
   echo "($LOCAL_BACKUP_DIR)"
	echo "2 - Enter advanced instructions"
	read DIRECT
	if [ "$DIRECT" = "1" ]; then
		source mysql-operations/local-backup-all-dbs.sh
      source start.sh
		#exit
	#else
	#   	OPERATION="local-backup"
	fi
   	#source mysql-commands/local-backup-all-dbs.sh
   	#source start.sh
   ;;
   "9") echo "quiting..." 
   	source mysql-saudations/end.sh
   	exit
   ;;
   "10") echo "Testing connections..." 
   	source mysql-commands/remote-test-connect.sh
   ;;
   "11") echo "Testing connections..." 
   	source mysql-commands/local-test-connect.sh
   ;;
esac

