#!/bin/bash
echo "Tip what service you want to execute?"
echo "1 - All tables"
echo "2 - Posts tables (posts, postmeta, categories...)"
read SERVICENUMBER

if [ "$SERVICENUMBER" -eq 1 ]; then
	echo "All tables selected"
	#source mysql-commands-groups/local-replace-remote.sh
	#SERVICECOMPLEMENT=""
else
	echo "Only posts related tables (posts, postmeta, terms, terms_taxonomy, term_relationships)"
	TABLES_SELECTED="$TABLE_PREFIX"posts,"$TABLE_PREFIX"postmeta,"$TABLE_PREFIX"termmeta,"$TABLE_PREFIX"terms,"$TABLE_PREFIX"term_relationships,"$TABLE_PREFIX"term_taxonomy
	TABLES_SELECTED_FOR_DUMP_LINE="${TABLE_PREFIX}posts ${TABLE_PREFIX}postmeta ${TABLE_PREFIX}termmeta ${TABLE_PREFIX}terms ${TABLE_PREFIX}term_relationships ${TABLE_PREFIX}term_taxonomy"
	#source mysql-commands-groups/local-replace-remote-posts.sh
	#SERVICECOMPLEMENT="-posts"
fi


