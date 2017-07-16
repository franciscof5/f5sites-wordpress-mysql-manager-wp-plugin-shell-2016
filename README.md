# F5 Sites | WordPress MySQL Manager
wpsql-cli provides an easy way to manage and speed-up WordPress development process by shortining WordPress SQL data management tasks. Ideal for multiple wordpress installs sharing the same database.

Usage examples:
```
wpsql-cli --export --posts-and-tax wp_custom_prefix_
wpsql-cli -e --all
wpsql-cli --auto --posts
wpsql-cli --compare --option wp_another_prefix_ database2
wpsql-cli --backup
wpsql-cli --wizard
wpsql-cli --help
```
Official Website: [F5 Sites WordPress MySQL Manager](https:www.f5sites.com/wordpress-mysql-manager) 

Developd by: [Francisco Matelli Matulovic](https://www.franciscomat.com)

## Description

WordPress MySQL Manager was designed to speedup wordpress data sync between wordpress servers instances, respecting WordPress original data model.

At the time it can be configured for 2 servers instances only, eg. development and production server. They connect trought SSH and use MySQL worpress special queries to sync data respecting WordPress original data model, you can sync only posts related content or just wp_options tables.

#### Exclusive feature: WordPress Posts Table Auto Sync (two ways)

You can check what server has the highest WordPress post ID and then automatically sync them (export, compact, download/upload, extract, safe copy, mysql import) usually server configurations is based on a master and slave replication schema, based on commits, but that sometimes can be frustraint for wordpress developers that use other logic for data management, eg. you can make changes on dev server while receiving only new posts from production server (for better knowing if you download all data from production server, wordpress will overwrite all data, posts and local changes, with auto sync posts you can always preserve server configuration).

### A) CONFIGURATION
You can use a default value for databasename + table prefix, but for many server configuration it varies.

Detaulf configurable vars
```
MYSQL_USER_LOCAL=""
MYSQL_PASS_LOCAL=""
#
SSH_USER=""
SSH_PASS=""
IP="1.1.1.1"
#
MYSQL_USER_REMOTE=""
MYSQL_PASS_REMOTE=""
#
LOCAL_BACKUP_DIR=/backup
LOCAL_TEMP_DIR=/tmp
LOCAL_SAFE_COPY_DIR=/backup
REMOTE_BACKUP_DIR=/backup
REMOTE_TEMP_DIR=/tmp
REMOTE_SAFE_COPY_DIR=/backup
#
DEFAULT_DATABASE="wordpress"
DETAULT_TABLE_PREFIX="wp_"
# mysdump option, comment to remove option when dumping https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html
LOCKTABLES=" --lock-tables=false "
DATABASES=" --databases"
DROPDB=" --add-drop-database "
CARACHTER=" --default-character-set=utf8 "
COMPA_M4=" --compatible=mysql4 "
COMPA_NT=" --compatible=no_table_options"
```

### B) USAGE

1. First change settings in config-example.sh and rename it to config.sh

2. Open terminal in that folder and run the command wpsql-cli

### C) STEP-BY-STEP WIZARD
For a different approach than command line you can run the wizard just by
```
$ wpsql-cli -w
Load configuration file... (to change it open config.sh)
What operation you need?
 AUTO
1 - Auto Sync - Check for highest post ID
 MANUAL
2 - Local to Remote - Replace database
3 - Remote to Local - Replace database
 COMPARE
4 - Compare Content - From table inside databases
5 - Compare Structure - From table inside databases
 BACKUP
7 - Local Export - Dump to a backup folder
8 - Remote Export and Download - (in development)
 QUIT
9 - Quit - exit F5 Sites WordPress MySQL Manager

```

### D) NOTES

Composer ready! It came across with composer json settings file

![Alt text](https://cdn.rawgit.com/franciscof5/wordpress-mysql-manager/eeeba0f9/wpsql-cli-basic-diagram.svg)
<img src="https://cdn.rawgit.com/franciscof5/wordpress-mysql-manager/eeeba0f9/wpsql-cli-basic-diagram.svg">


