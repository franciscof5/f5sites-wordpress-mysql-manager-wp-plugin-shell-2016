echo "Looking for last post_id local in database: $DATABASENAME, posts tables: $POSTS_TABLE..."
LAST_ID_LOCAL=$(mysql $DATABASENAME     -se "SELECT ID FROM "$TABLE_PREFIX"posts ORDER BY ID DESC LIMIT 1")
echo "LOCAL last post ID: $LAST_ID_LOCAL"
