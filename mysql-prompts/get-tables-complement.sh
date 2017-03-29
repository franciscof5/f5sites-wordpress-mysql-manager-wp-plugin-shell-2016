#!/bin/bash
echo "Tip what tables inside database you want to use, backup dir ($LOCAL_TEMP_DIR)"
echo "1 - All tables inside database $DATABASENAME (ignore table prefix)"
echo "2 - Only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
echo "3 - WordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)"
echo "4 - Posts - ${TABLE_PREFIX}posts"
echo "9 - Enter table(s) name(s) separated with commas without spaces and without prefix, like table1,table2,table3,table4"
read SERVICENUMBER

case "$SERVICENUMBER" in
   "1") echo "Selected 1 - All tables in database will be replaced"
      #source mysql-commands/local-dump.sh
      TABLES_SELECTED_FOR_DUMP_LINE=""
      TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
   "2") echo "Selected 2 - Prefixed tables only NOT WORKING"
   	#GET TABLES TO A FILE
   	echo "select table_name from tables where table_schema = '$DATABASENAME' and table_name like '${TABLE_PREFIX}%'"
   	mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -N information_schema -e "select table_name from tables where table_schema = '$DATABASENAME' and table_name like '${TABLE_PREFIX}%'" > tables.txt 
   	$TABLES_SELECTED_FOR_DUMP_LINE=$( cat tables.txt )
   	TABLES_SELECTED=$TABLE_PREFIX
   ;;
   "3") echo "Selected 3 - WordPress Posts" 
   	echo "Only posts related tables (posts, postmeta, terms, terms_taxonomy, term_relationships)"
	TABLES_SELECTED="$TABLE_PREFIX"posts,"$TABLE_PREFIX"postmeta,"$TABLE_PREFIX"termmeta,"$TABLE_PREFIX"terms,"$TABLE_PREFIX"term_relationships,"$TABLE_PREFIX"term_taxonomy
	TABLES_SELECTED_FOR_DUMP_LINE="${TABLE_PREFIX}posts ${TABLE_PREFIX}postmeta ${TABLE_PREFIX}termmeta ${TABLE_PREFIX}terms ${TABLE_PREFIX}term_relationships ${TABLE_PREFIX}term_taxonomy"
   ;;
   "4") echo "Selected 4 - ${TABLE_PREFIX}posts "
   TABLES_SELECTED="${TABLE_PREFIX}posts"
   TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
   "9") echo "Selected 9 - Enter table(s) name(s) (WITHOUT PREFIX)"
   read TABLES_SELECTED_ENTERED
   TABLES_SELECTED="${TABLE_PREFIX}${TABLES_SELECTED_ENTERED}"
   TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
esac
