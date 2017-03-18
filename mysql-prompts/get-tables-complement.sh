#!/bin/bash
echo "Tip what service you want to execute?"
echo "1 - All Database $DATABASENAME (ignore table prefix)"
echo "2 - Tables with prefix $TABLE_PREFIX inside database $DATABASENAME (local-to-remote only avaiable right now)"
echo "3 - Only WordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy)"
read SERVICENUMBER

case "$SERVICENUMBER" in
   "1") echo "Selected 1 - All tables in database will be replaced"
   ;;
   "2") echo "Selected 2 - Prefixed tables only"
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
esac
