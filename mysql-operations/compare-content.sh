#!/bin/bash

COMPA_NT=" --compatible=no_table_options "

TABLE="wp_options"

source mysql-commands/local-dump.sh

source mysql-commands/local-extract.sh

source mysql-commands/remote-dump.sh

source mysql-commands/remote-download.sh

source mysql-commands/diff.sh
