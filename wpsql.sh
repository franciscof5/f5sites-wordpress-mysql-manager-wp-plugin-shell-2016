#!/bin/bash

# Carregar configurações e saudações
source mysql-saudations/hello.sh
source mysql-commands/load-config.sh

# Variáveis padrão
OPERATION="loading..."
DATABASENAME=$DEFAULT_DATABASE
TABLE_PREFIX=$DEFAULT_TABLE_PREFIX

# Processar argumentos
case "$1" in
    -db | --daily-backup)
        echo "Selected - Daily Backup"
        OPERATION="daily-local-backup-all-dbs"
        ;;
    -dr | --daily-replace)
        echo "Selected - Daily Replace"
        OPERATION="daily-remote-replace-local"
        ;;
    --all)
        echo "All tables: $DATABASENAME (all tables, ignoring table prefix previous entered)"
        OPERATION="local-dump"
        ;;
    --prefixed)
        echo "Prefixed tables: only tables with prefix $TABLE_PREFIX inside database $DATABASENAME"
        OPERATION="local-dump"
        ;;
    --posts-and-tax)
        echo "WordPress posts tables (${TABLE_PREFIX}posts, ${TABLE_PREFIX}postmeta, ${TABLE_PREFIX}termmeta, ${TABLE_PREFIX}terms, ${TABLE_PREFIX}term_relationships, ${TABLE_PREFIX}term_taxonomy) (Best choice for auto-sync)"
        OPERATION="local-dump"
        ;;
    --posts)
        echo "Posts tables"
        OPERATION="local-dump"
        ;;
    --post-type)
        echo "Posts type inside posts tables"
        OPERATION="local-dump"
        ;;
    --options)
        echo "Options table - ${TABLE_PREFIX}options"
        OPERATION="local-dump"
        ;;
    --name)
        echo "Custom tables"
        OPERATION="local-dump"
        ;;
    -ia | --import-all)
        OPERATION="remote-replace-local"
        echo "not working... end"
        exit
        ;;
    -ip | --import-prefixed)
        OPERATION="remote-replace-local"
        ;;
    -a | --auto)
        echo "Selected 1 - Auto Sync"
        OPERATION="auto-sync"
        ;;
    -c | --compare)
        echo "Selected - Compare Content"
        OPERATION="compare-content"
        ;;
    -b | --backup)
        echo "Selected - Backup"
        OPERATION="local-backup-all-dbs"
        ;;
    -w | --wizard)
        echo "Wizard"
        source wizard.sh
        exit
        ;;
    -h | --help)
        echo "HELP"
        echo "Commands list:"
        echo "--all          : all tables"
        echo "--prefixed     : tables with prefix $TABLE_PREFIX in $DATABASENAME"
        echo "--posts-and-tax: WordPress posts tables"
        echo "--posts        : posts tables - ${TABLE_PREFIX}posts"
        echo "--options      : options table - ${TABLE_PREFIX}options"
        echo "--name         : custom tables"
        echo "--import-all      : import all tables from remote to local"
        echo "--import-prefixed : import prefixed tables"
        echo "-a | --auto    : auto sync"
        echo "-c | --compare : compare table structure"
        echo "-b | --backup  : perform a backup"
        echo "-w | --wizard  : step-by-step wizard"
        echo "-h | --help    : show help"
        source mysql-saudations/end.sh
        exit
        ;;
esac

# Sobrescrever prefixo e banco de dados se fornecidos
[ -n "$2" ] && TABLE_PREFIX=$2
[ -n "$3" ] && DATABASENAME=$3

# Se nenhum argumento for passado, iniciar o assistente
if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ]; then
    echo "Wizard started"
    source wizard.sh
    exit
fi

# Exibir operação e executar os scripts necessários
echo "Operation: $OPERATION, Prefix: $TABLE_PREFIX, Database: $DATABASENAME"
source mysql-commands/table-generator.sh
source mysql-operations/$OPERATION.sh
