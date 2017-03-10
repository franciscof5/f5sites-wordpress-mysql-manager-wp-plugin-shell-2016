#!/bin/bash
echo "Clear wp_options transients exccess records in master and slave"
echo "Hi, $USER"

echo "Database: $1"

#if [ "$DATABASENAME" == "" ]; then
if [ "$1" == "" ]; then
	echo "Write database name"
	read DATABASENAME
else
	DATABASENAME=$1
fi
echo "Database: $DATABASENAME"
#else
#	echo "Database: $DATABASENAME"
#fi

echo "cleaning master (localhost $HOSTNAME)..."
mysql $DATABASENAME -Bse 'DELETE FROM wp_options WHERE option_name LIKE ("%\_transient\_%")'

echo "connecting to slave to clean..."
ssh "mysql $DATABASENAME -e 'DELETE FROM wp_options WHERE option_name LIKE (\"%\_transient\_%\")'"

echo "clear-wp_options_transient-on-both.sh ended."
echo "by Francisco Mat | franciscomat.com | f5sites.com"
