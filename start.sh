#!/bin/bash

source mysql-saudations/hello.sh

source mysql-commands/load-config.sh

source mysql-prompts/get-operation.sh

source mysql-prompts/get-database-name.sh

source mysql-prompts/get-table-prefix.sh

source mysql-prompts/get-tables-complement.sh

source mysql-commands-groups/$OPERATION.sh

source start.sh

#source mysql-saudations/end.sh

