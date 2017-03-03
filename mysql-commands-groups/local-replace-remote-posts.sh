#!/bin/bash
source mysql-commands/local-dump-posts.sh

source mysql-commands/local-upload-to-remote-posts.sh

source mysql-commands/remote-safe-copy.sh

source mysql-commands/local-replace-remote-posts.sh
