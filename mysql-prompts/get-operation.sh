#!/bin/bash
echo "What operation you need?"
echo " TEST CONNECTION"
echo "1 - Local test - MySQL connection"
echo "2 - Remote test - SSH connection & MySQL connection"
echo " CUSTOM WP DUMP"
echo "5 - Custom local export"
echo "6 - Compare content" 
echo "7 - Auto Sync - Check for highest post ID"
echo " QUIT"
echo "9 - Quit - exit F5 Sites WordPress MySQL Manager"
read OPERATION

case "$OPERATION" in
   "1") echo "Selected 1 - Testing connections..." 
   	source mysql-commands/local-test-connect.sh
   ;;
   "2") echo "Selected 2 - Testing connections..." 
   	source mysql-commands/remote-test-connect.sh
   ;;
   #
   "5") echo "Selected 5 - Local backup all(dump)" 
	echo "1 - Quick export all database zipped to a folder"
   echo "($LOCAL_BACKUP_DIR)"
	echo "2 - Enter advanced instructions"
	read DIRECT
	if [ "$DIRECT" = "1" ]; then
  	   OPERATION="local-backup"
		# source mysql-operations/local-backup-all-dbs.sh
      #source start.sh
		#exit
	#else
	fi
   	#source mysql-commands/local-backup-all-dbs.sh
   	#source start.sh
   ;;
   "6") echo "Selected 6 - Compare structure" 
   	OPERATION="compare-structure"
   ;;
   "7") echo "Selected 7 - Auto Sync" 
   	OPERATION="auto-sync"
   ;;
   "9") echo "quiting..." 
   	source mysql-saudations/end.sh
   	exit
   ;;
esac

