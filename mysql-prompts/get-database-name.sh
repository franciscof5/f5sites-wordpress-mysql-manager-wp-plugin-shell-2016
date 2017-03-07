echo "What database you want to sync? Write database name and hit enter, tip SHOW to see all databases in you local MySQL, leave empty for default: $DEFAULT_DATABASE"
read DATABASENAME

if  [[ -z "$DATABASENAME" ]]; then
	echo "Using default database: $DEFAULT_DATABASE"
	DATABASENAME=$DEFAULT_DATABASE
else
    if [ "$DATABASENAME" == "SHOW" ]; then
    	echo "SHOWING..."
    	mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -se "SHOW DATABASES;"
    	#echo "What database you want to sync? Write database name and hit enter"
	#read DATABASENAME
    	source mysql-prompts/get-database-name.sh
    fi
fi
