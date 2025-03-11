REMOTE_BACKUP_DIR=/backup
echo "Remote server check $REMOTE_BACKUP_DIR..."
ssh $SSH_USER@$IP 'test -d "$REMOTE_BACKUP_DIR" || mkdir -p "$REMOTE_BACKUP_DIR"'

echo "Dumping all copys of local databases to $REMOTE_BACKUP_DIR..."