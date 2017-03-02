mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL  -se "SHOW DATABASES;"

echo "What database you want to sync? Write database name and hit enter, leave empty for default: $DEFAULT_DATABASE"
read DATABASENAME

if  [[ -z "$DATABASENAME" ]]; then
	echo "Using default database: $DEFAULT_DATABASE"
	DATABASENAME=$DEFAULT_DATABASE
fi
