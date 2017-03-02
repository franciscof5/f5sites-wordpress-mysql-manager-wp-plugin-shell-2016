echo "Looking for last post_id local..."
LAST_ID_LOCAL=$(mysql fnetwork -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -se "SELECT ID FROM $POSTS_TABLE ORDER BY ID DESC LIMIT 1")
echo "LOCAL last post ID: $LAST_ID_LOCAL"
