#!/bin/bash
source mysql-saudations/hello.sh

source mysql-commands/load-config.sh

DATABASENAME=$DEFAULT_DATABASE
TABLE_PREFIX=$DEFAULT_TABLE_PREFIX
TABLES_SELECTED_ENTERED=""
TABLES_SELECTED_FOR_DUMP_LINE=""
SERVICENUMBER=""
case "$1" in
   -a | --auto) echo "Selected 1 - Auto Sync" 
   	OPERATION="auto-sync"
   ;;
	-e | --export )
	    OPERATION="local-replace-remote"
	    case "$2" in
		   --all) echo "All Database: $DATABASENAME (all tables, ignoring table prefix previous entered)"
				$SERVICENUMBER=1
		   ;;
		   --prefixed) echo "Prefixed: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
		   		$SERVICENUMBER=2
		   ;;
		   --posts-and-tax) echo "WordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)"
		   		$SERVICENUMBER=3
		   ;;
		   --posts) echo "Posts - ${TABLE_PREFIX}posts"
		   		$SERVICENUMBER=4
		   ;;
		   --options) echo "Options - ${TABLE_PREFIX}options"
		   		$SERVICENUMBER=5
		   ;;
		   *)
				TATABLES_SELECTED="${TABLE_PREFIX}${2}"
			;;
		esac
		TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
	    if [ -z "$3" != "" ]; then
	  	  TABLE_PREFIX=$3
		fi
		if [ "$4" != "" ]; then
	  	  DATABASENAME=$4
		fi

	;;
	-i | --import )    
		OPERATION="remote-replace-local"
		DATABASENAME=$DEFAULT_DATABASE
	;;
   -c | --compare) echo "Selected 1 - Auto Sync" 
   	OPERATION="compare-content"
   ;;
   -b | --backup) echo "Selected - Backup" 
	OPERATION="local-backup-all-dbs"
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
echo "Op = $OPERATION, db = $DATABASENAME, pref = $TABLE_PREFIX, ser=$SERVICENUMBER"
source mysql-commands/table-generator.sh
source mysql-operations/$OPERATION.sh