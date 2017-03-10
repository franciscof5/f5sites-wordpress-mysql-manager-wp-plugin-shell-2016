#!/bin/bash
source ../mysql-commands/load-config.sh
CONVERT_SCRIPT=extra_convert_InnoDB_to_MyISAM.sql
#mysqldump -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL  -AN -e"SELECT CONCAT('ALTER TABLE ',table_schema,'.',table_name,' ENGINE=MyISAM;') FROM information_schema.tables WHERE engine ='InnoDB';" > ${CONVERT_SCRIPT}
#mysqldump -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL  -A < ${CONVERT_SCRIPT}
#mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -AN -e"SELECT CONCAT('ALTER TABLE ',table_schema,'.',table_name,' ENGINE=MyISAM;') FROM information_schema.tables WHERE table_schema='fnetwork' AND engine='InnoDB';" > ${CONVERT_SCRIPT}
#mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -A < ${CONVERT_SCRIPT}
mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL -e "SELECT concat('ALTER TABLE ', TABLE_NAME,' ENGINE=MYISAM;') FROM Information_schema.TABLES WHERE TABLE_SCHEMA = 'fnetwork' AND ENGINE = 'InnoDB' AND TABLE_TYPE = 'BASE TABLE'" | tail -n+2 >> alter.sql
