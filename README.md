# F5 Sites | WordPress MySQL Manager (wpsql)

[![GitHub version](https://img.shields.io/badge/wordpress--plugin-dev-green.svg)](https://img.shields.io/badge/wordpress--plugin-dev-red.svg) 
[![GitHub version](https://img.shields.io/badge/shell--script-dev-red.svg)](https://img.shields.io/badge/shell--script-dev-red.svg) 
[![GitHub version](https://img.shields.io/badge/wpackgist-ready-green.svg)](https://img.shields.io/badge/composer-ready-green.svg)

wpsql-cli provides an easy way to manage and speed-up WordPress development process by shortining WordPress SQL data management tasks. Ideal for multiple wordpress installs sharing the same database.

Official Website: [F5 Sites WordPress MySQL Manager](https:www.f5sites.com/wordpress-mysql-manager) 

Developd by: [Francisco Matelli Matulovic](https://www.franciscomat.com)

Usage examples (after configuration):
```
wpsql --posts
wpsql --posts-and-tax
wpsql --options wp2_
wpsql --prefix_ wp_ database2
wpsql --auto
wpsql --compare wp3_ database3
wpsql --backup
wpsql --wizard
wpsql --help
```

## Description

WordPress MySQL Manager was designed to speedup wordpress data sync between wordpress servers instances, respecting WordPress original data model.

![Basic Diagram](https://cdn.rawgit.com/franciscof5/wordpress-mysql-manager/eeeba0f9/wpsql-cli-basic-diagram.svg)

At the time it can be configured for 2 servers instances only, eg. development and production server. They connect trought SSH and use MySQL worpress special queries to sync data respecting WordPress original data model, you can sync only posts related content or just wp_options tables.


### CONFIGURATION
Change default configurable variables and rename config-example.sh to config.sh.

Tip: You can use a default value for database name and table prefix, shortening even more the commands, if you run just one WordPress site it is the best option, or if you are working most of time with one prefixed wp install on some database.

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
#
IGNORE_REMOTE_SAFE_BACKUP=0
# mysdump option, comment to remove option when dumping https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html
LOCKTABLES=" --lock-tables=false "
DATABASES=" --databases"
DROPDB=" --add-drop-database "
CARACHTER=" --default-character-set=utf8 "
COMPA_M4=" --compatible=mysql4 "
COMPA_NT=" --compatible=no_table_options"
```

### Installation

Just run sudo ./install.sh on repositorie to install it on your user /bin folder, making the command wpsql global avaiable trought bash.

```
sudo ./install.sh
```

Alternative: you can run ./wpsql-li.sh command in the repositorie folder

Wizard: you can run ./wizard.sh for more friendly like process to manage data


### Commands list

* --all          : all tables: $DATABASENAME (all tables, ignoring table prefix previous entered)
* --prefixed     : prefixed tables: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME
* --posts-and-tax: wordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)
* --posts        : posts tables - ${TABLE_PREFIX}posts
* --options      : options table - ${TABLE_PREFIX}options
* --name         : prompt for user to enter custom tables separated by commas
* -a | --auto    : auto sync between servers instances by highest wp post_id on selected table
* -i | --import  : import from remote (probably production) to local (probably dev)
* -c | --compare : compare sql tables structure (diff) (ignores data)
* -b | --backup  : just perfom a backup
* -w | --wizard  : to run a step-by-step wizard
* -h | --help    : help text
		
#### Exclusive feature: WordPress Posts Table Auto Sync (two ways)

You can check what server has the highest WordPress post ID and then automatically sync them (export, compact, download/upload, extract, safe copy, mysql import) usually server configurations is based on a master and slave replication schema, based on commits, but that sometimes can be frustraint for wordpress developers that use other logic for data management, eg. you can make changes on dev server while receiving only new posts from production server (for better knowing if you download all data from production server, wordpress will overwrite all data, posts and local changes, with auto sync posts you can always preserve server configuration).


### USAGE INSTRUCTIONS

1. First change settings in config-example.sh and rename it to config.sh

2. Open terminal in that folder and run the command ./wpsql-cli.sh --commandname --tableprefix --databasename

3. If you run ./install.sh you can just open terminal anywhere and run wpsql command with options

### WIZARD
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


