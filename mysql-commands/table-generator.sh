#!/bin/bash
case "$SERVICENUMBER" in
   "1") echo "Selected all tables in database will be replaced"
      #source mysql-commands/local-dump.sh
      TABLES_SELECTED_FOR_DUMP_LINE=""
      TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
   "2") echo "Selected prefixed tables"
   	#GET TABLES TO A FILE
   	echo "select table_name from tables where table_schema = '$DATABASENAME' and table_name like '${TABLE_PREFIX}%'"
   	mysql     -N information_schema -e "select table_name from tables where table_schema = '$DATABASENAME' and table_name like '${TABLE_PREFIX}%'" > $LOCAL_TEMP_DIR/tables.txt 
   	#$TABLES_SELECTED_FOR_DUMP_LINE="`cat tables.txt`"
   	TABLES_SELECTED_FOR_DUMP_LINE=""
   	while read line; do 
	     TABLES_SELECTED_FOR_DUMP_LINE="$TABLES_SELECTED_FOR_DUMP_LINE $line"    
	   done < $LOCAL_TEMP_DIR/tables.txt
   	TABLES_SELECTED=$TABLE_PREFIX
   ;;
   "3") echo "Selected WordPress posts and taxonomies tables" 
   	echo "Only posts related tables (posts, postmeta, terms, terms_taxonomy, term_relationships)"
	  TABLES_SELECTED="$TABLE_PREFIX"posts,"$TABLE_PREFIX"postmeta,"$TABLE_PREFIX"termmeta,"$TABLE_PREFIX"terms,"$TABLE_PREFIX"term_relationships,"$TABLE_PREFIX"term_taxonomy
	  TABLES_SELECTED_FOR_DUMP_LINE="${TABLE_PREFIX}posts ${TABLE_PREFIX}postmeta ${TABLE_PREFIX}termmeta ${TABLE_PREFIX}terms ${TABLE_PREFIX}term_relationships ${TABLE_PREFIX}term_taxonomy"
   ;;
   "4") echo "Selected ${TABLE_PREFIX}posts "
      TABLES_SELECTED="${TABLE_PREFIX}posts"
      TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
   "5") echo "Selected  ${TABLE_PREFIX}options "
      TABLES_SELECTED="${TABLE_PREFIX}options"
      TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
   "9") echo "Enter table(s) name(s) (WITHOUT PREFIX)"
      read TABLES_SELECTED_ENTERED
      TABLES_SELECTED="${TABLE_PREFIX}${TABLES_SELECTED_ENTERED}"
      TABLES_SELECTED_FOR_DUMP_LINE=$TABLES_SELECTED
   ;;
esac
