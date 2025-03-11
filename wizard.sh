#!/bin/bash

source mysql-saudations/hello.sh

source mysql-commands/load-config.sh

source mysql-prompts/get-operation.sh

source mysql-prompts/get-database-name.sh

source mysql-prompts/get-table-prefix.sh

source mysql-prompts/get-tables-complement.sh

if [ -f "mysql-operations/$OPERATION.sh" ]; then
    source mysql-operations/$OPERATION.sh
else
    echo "Error: Operation script not found -> mysql-operations/$OPERATION.sh"
    exit 1
fi

source start.sh

#source mysql-saudations/end.sh

