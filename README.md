F5 Sites | WordPress MySQL Manager

Official Website: f5sites.com/wordpress-mysql-manager

Developd by: Francisco Matelli Matulovic - franciscomat.com

WordPress MySQL Manager was designed to speedup wordpress data sync between wordpress servers instances, respecting WordPress original data model.

At the time it can be configured for 2 servers instances only, eg. development and production server. They connect trought SSH and use MySQL worpress special queries to sync data respecting WordPress original data model, you can sync only posts related content or just wp_options tables.

AUTO SYNC POSTS - TWO WAYS
You can check wath server has the highest WordPress post ID and then automatcally sync between them, usually server configurations is based on a master and slave replication schema, based on commits, but that sometimes can be frustraint for wordpress developers that use other logic for data management, for example, you can make changes on dev server while receiving only new posts from production server (for better knowing if you download all data from production server, wordpress will overwrite all data, posts and local changes, with auto sync posts you can always preserve server configuration).

A) CONFIGURATION
You can use a default value for databasename + table prefix, but for many server configuration it varies.

B) USAGE

1 - First change settings in config-example.sh and rename it to config.sh

2 - Open terminal in that folder and tip ./use-command-name

B) NOTES

Composer ready! It came across with composer json settings file
