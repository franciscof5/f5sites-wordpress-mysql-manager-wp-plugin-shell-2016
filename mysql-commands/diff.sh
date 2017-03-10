#!/bin/bash
echo "Dumping a diff file for $DATABASENAME to: $LOCAL_TEMP_DIR..."
diff $LOCAL_TEMP_DIR/$DATABASENAME-local.sql $LOCAL_TEMP_DIR/$DATABASENAME-remote.sql > $LOCAL_TEMP_DIR/$DATABASENAME-diff.sql
gedit $LOCAL_TEMP_DIR/$DATABASENAME-diff.sql
