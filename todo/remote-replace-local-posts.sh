#!/bin/bash
source mysql-commands/remote-dump-posts.sh

source mysql-commands/remote-download-posts.sh

source mysql-commands/local-safe-copy.sh

source mysql-commands/remote-replace-local-posts.sh
