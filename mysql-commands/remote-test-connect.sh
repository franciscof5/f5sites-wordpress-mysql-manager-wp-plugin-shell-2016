echo "Test remoting connection"
echo "ssh $SSH_USER@$IP"
echo "Dont forget to ssh-keygen e add ssh-copy-id to you remote server"

status=$(ssh -o BatchMode=yes -o ConnectTimeout=5 $SSH_USER@$IP echo ok 2>&1)

if [[ $status == ok ]] ; then
  echo SSH OK
  echo "SSH mysql -u MYSQL_USER_REMOTE -p MYSQL_PASS_REMOTE -e use $DEFAULT_DATABASE"
  if (ssh $SSH_USER@$IP mysql -u $MYSQL_USER_REMOTE -p$MYSQL_PASS_REMOTE -e "use $DEFAULT_DATABASE"); then
    echo "Remote MySQL OK"
  else
    echo "Remote MySQL failed"
  fi
elif [[ $status == "Permission denied"* ]] ; then
  echo no_auth
else
  echo other_error
fi

source wizard.sh
