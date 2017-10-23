#!/bin/bash
source mysql-saudations/hello.sh

source mysql-commands/load-config.sh

OPERATION="loading..."
DATABASENAME=$DEFAULT_DATABASE
TABLE_PREFIX=$DEFAULT_TABLE_PREFIX
TABLES_SELECTED_ENTERED=""
TABLES_SELECTED_FOR_DUMP_LINE=""
SERVICENUMBER=""
case "$1" in
	--all) echo "All tables: $DATABASENAME (all tables, ignoring table prefix previous entered)"
		OPERATION="local-replace-remote"
		SERVICENUMBER=1
	;;
	--prefixed) echo "Prefixed tables: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
		OPERATION="local-replace-remote"
		SERVICENUMBER=2
	;;
	--posts-and-tax) echo "WordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)"
		OPERATION="local-replace-remote"
		SERVICENUMBER=3
	;;
	--posts) echo "Posts tables"
		OPERATION="local-replace-remote"
		SERVICENUMBER=4
	;;
	--post-type) echo "Posts type inside posts tables"
		OPERATION="local-replace-remote"
		SERVICENUMBER=6
	;;
	--options) echo "Options table - ${TABLE_PREFIX}options"
		OPERATION="local-replace-remote"
		SERVICENUMBER=5
	;;
	--name) echo "Custom tables"
		OPERATION="local-replace-remote"
		SERVICENUMBER=9
	;;
	-ia | --import-all )
		OPERATION="remote-replace-local"
		SERVICENUMBER=1
		echo "not working... end"
		exit
	;;
	-ip | --import-prefixed )
		OPERATION="remote-replace-local"
		SERVICENUMBER=2
		#echo "not working... end"
		#exit
	;;
	-a | --auto) echo "Selected 1 - Auto Sync" 
		OPERATION="auto-sync"
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
		echo "--all          : all tables"
		echo "--prefixed     : prefixed tables: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
		echo "--posts-and-tax: wordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)"
		echo "--posts        : posts tables - ${TABLE_PREFIX}posts"
		echo "--options      : options table - ${TABLE_PREFIX}options"
		echo "--name         : prompt for user to enter custom tables separated by commas"
		echo "--import-all      : import from remote (probably production) to local (probably dev), all tables"
		echo "--import-prefixed : prefixed tables: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
		echo "-a | --auto    : auto sync between servers instances by highest wp post_id on selected table"
		echo "-c | --compare : compare sql tables structure (diff) (ignores data)"
		echo "-b | --backup  : just perfom a backup"
		echo "-w | --wizard  : to run a step-by-step wizard"
		echo "-h | --help    : help text"
		echo "Don't forget to config it, for detailed instructions see readme.MD"
		source mysql-saudations/end.sh
	;;
esac
if [ "$2" != "" ]; then
	  TABLE_PREFIX=$2
fi
if [ "$3" != "" ]; then
	  DATABASENAME=$3
fi
#TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED

echo "Operation $OPERATION, prefix $TABLE_PREFIX, database $DATABASENAME, service $SERVICENUMBER, 1 $1, 2 $2, 3 $3"
source mysql-commands/table-generator.sh
source mysql-operations/$OPERATION.sh