echo "What database you want to sync? Write database name and hit enter, leave empty for fnetwork"
read DATABASENAME

if [ "$DATABASENAME"=="" ]; then
echo "Using default database: $DEFAULT_DATABASE"
DATABASENAME=$DEFAULT_DATABASE
fi
