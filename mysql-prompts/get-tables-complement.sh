#!/bin/bash
echo "Tip what tables inside database you want to use, backup dir ($LOCAL_TEMP_DIR)"
echo "1 - All Database: $DATABASENAME (all tables, ignoring table prefix previous entered)"
echo "2 - Prefixed: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
echo "3 - WordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)"
echo "4 - Posts - ${TABLE_PREFIX}posts"
echo "5 - Options - ${TABLE_PREFIX}options"
echo "9 - Enter table(s) name(s) separated with commas without spaces and without prefix, like table1,table2,table3,table4"
read SERVICENUMBER

source mysql-commands/table-generator.sh