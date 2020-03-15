echo "Test local connection"
echo "mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL -P $MYSQL_PORT_LOCAL -e use $DEFAULT_DATABASE"
if (mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -h $MYSQL_HOST_LOCAL -P $MYSQL_PORT_LOCAL -e "use $DEFAULT_DATABASE"); then
	echo "Local MySQL OK"
else
	echo "Local MySQL failed"
fi

source wizard.sh
