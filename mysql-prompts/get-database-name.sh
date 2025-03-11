echo "Write database name and hit enter, tip SHOW to see all databases in you local MySQL, leave empty for default: $DEFAULT_DATABASE"
read DATABASENAME

if  [[ -z "$DATABASENAME" ]]; then
	echo "Using default database: $DEFAULT_DATABASE"
	DATABASENAME=$DEFAULT_DATABASE
else
    if [ "$DATABASENAME" == "SHOW" ]; then
    	echo "Showing..."
    	mysql   -se "SHOW DATABASES;"
    	source mysql-prompts/get-database-name.sh
    fi
fi
