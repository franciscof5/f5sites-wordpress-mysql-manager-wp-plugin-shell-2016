echo "Test local connection"
echo "mysql     -e use $DEFAULT_DATABASE"
if (mysql     -e "use $DEFAULT_DATABASE"); then
	echo "Local MySQL OK"
else
	echo "Local MySQL failed"
fi

source wizard.sh
