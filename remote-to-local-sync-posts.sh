#!/bin/bash
echo "Dumping remote copy of $DATABASENAME tables with prefix $TABLE_PREFIX"
ssh $SSH_USER@$IP "mysqldump -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE --lock-tables=false  --add-drop-database --compatible=mysql4,no_table_options --default-character-set=utf8 $DATABASENAME f5sites_posts f5sites_postmeta f5sites_termmeta f5sites_terms f5sites_term_relationships f5sites_term_taxonomy | gzip > /tmp/$DATABASENAME-f5sites_posts.sql.gz"

echo "Downloading and extracting set of tables from database..."
scp $SSH_USER@$IP:/tmp/$DATABASENAME-f5sites_posts.sql.gz /tmp/$DATABASENAME-f5sites_posts.sql.gz
gunzip -fv /tmp/$DATABASENAME-f5sites_posts.sql.gz 

echo "importing and replace local data with remote..."
mysql -u $MYSQL_USER_LOCAL -p$MYSQL_PASS_LOCAL $DATABASENAME < /tmp/$DATABASENAME-f5sites_posts.sql

#echo "sync-posts-remote-to-local.sh ended."
#echo "by Francisco Matelli Matulovic | franciscomat.com | f5sites.com"

#1 - busca o ultimo post id local
#2 - busca o ultimo post id remote
#3 - compara a diferenca

#pega todos os posts LIMIT
#query for 3400 + LIMIT f5sites_postmeta WHERE post_id = $i

#4 - prepara o pacote 
#4.1 - consulta post_meta e tudo relacionado ao ID de cada um que der diferente
#5 - faz copia de seguranca
#6 - sobrescreve
