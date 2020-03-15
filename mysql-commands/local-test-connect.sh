echo "Test local connection"
if (mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -e "use $DEFAULT_DATABASE"); then
	echo "Local MySQL OK"
else
	echo "Local MySQL failed"
fi
