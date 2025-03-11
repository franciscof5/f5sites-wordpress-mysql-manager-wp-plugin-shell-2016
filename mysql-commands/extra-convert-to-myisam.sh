#!/bin/bash
source ../mysql-commands/load-config.sh
CONVERT_SCRIPT=extra_convert_InnoDB_to_MyISAM.sql
mysql     -e "SELECT concat('ALTER TABLE ', TABLE_NAME,' ENGINE=MYISAM;') FROM Information_schema.TABLES WHERE TABLE_SCHEMA = 'fnetwork' AND ENGINE = 'InnoDB' AND TABLE_TYPE = 'BASE TABLE'" | tail -n+2 >> alter.sql
