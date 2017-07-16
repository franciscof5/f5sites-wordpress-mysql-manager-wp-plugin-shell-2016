#!/bin/bash
case "$1" in
   -a | --auto) echo "Selected 1 - Auto Sync" 
   	OPERATION="auto-sync"
   ;;
   #-m | --manual) echo "Selected - Manual Sync"
	#while [ "$2" != "" ]; do
	    #case $2 in
	        -e | --export )
	            OPERATION="local-replace-remote"
	        ;;
	        -i | --import )    
				OPERATION="remote-replace-local"
	        ;;
	    #esac
	    
	#done
   	#source mysql-prompts/get-tables-complement.sh
   ;;
   -c | --compare) echo "Selected 1 - Auto Sync" 
   	OPERATION="compare-content"
   ;;
   -b | --backup) echo "Selected - Backup" 
	OPERATION="backup"
   	#source mysql-commands/local-backup-all-dbs.sh
   ;;
   -w | --wizard) echo "Wizard" 
   	source wizard.sh
   ;;
   -h | --help) echo "HELP"
	echo "Commands lists:"
	echo "-a | --auto    : auto sync between servers instances by highest wp post_id on selected table"
	echo "-e | --export  : export local (probably dev) server to remote (probably production)"
	echo "-i | --import  : import from remote (probably production) to local (probably dev)"
	echo "-c | --compare : compare sql tables structure (diff) (ignores data)"
	echo "-b | --backup  : just perfom a backup (-l local backup, -r remote backup)"
   	echo "-w | --wizard  : to run a step-by-step wizard"
   	echo "-h | --help    : help text"
   	echo "Don't forget to config it, for detailed instructions see readme.MD"
   	source mysql-saudations/end.sh
   ;;
esac
echo "Op = $OPERATION"