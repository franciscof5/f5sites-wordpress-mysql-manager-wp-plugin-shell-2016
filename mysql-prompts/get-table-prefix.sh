echo "Enter table prefix with underline_, leave empty for: "$DATABASENAME"_"
read TABLE_PREFIX

if  [[ -z "$TABLE_PREFIX" ]]; then
	#echo "Using default table prefix: $DEFAULT_TABLE_PREFIX"
	#TABLE_PREFIX="$DEFAULT_TABLE_PREFIX"
	echo "Using default table prefix: $DATABASENAME_"
	TABLE_PREFIX="$DATABASENAME"_
	
fi


