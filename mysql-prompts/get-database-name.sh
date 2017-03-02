echo "What database you want to sync? Write database name and hit enter, leave empty for fnetwork"
read DATABASENAME

if [ "$DATABASENAME"=="" ]; then
echo "Using default database: fnetwork"
DATABASENAME="fnetwork"
fi
