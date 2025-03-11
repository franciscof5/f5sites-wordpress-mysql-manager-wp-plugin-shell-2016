#!/bin/bash




echo "importing and replace local data with remote..."
mysql   $DATABASENAME < /tmp/$DATABASENAME-f5sites_posts.sql

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
