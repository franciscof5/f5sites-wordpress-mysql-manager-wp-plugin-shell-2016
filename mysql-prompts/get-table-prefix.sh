echo "Enter table prefix WITHOUT underline_, leave empty for: $DEFAULT_TABLE_PREFIX"
read TABLE_PREFIX

if  [[ -z "$TABLE_PREFIX" ]]; then
	#echo "Using default table prefix: $DEFAULT_TABLE_PREFIX"
	#TABLE_PREFIX="$DEFAULT_TABLE_PREFIX"
	echo "Using default table prefix: $DEFAULT_TABLE_PREFIX"
	TABLE_PREFIX=$DEFAULT_TABLE_PREFIX
else
	echo "Table prefix is: ${TABLE_PREFIX}_"
	TABLE_PREFIX="${TABLE_PREFIX}_"
fi


