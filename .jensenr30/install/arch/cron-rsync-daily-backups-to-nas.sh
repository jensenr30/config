#!/usr/bin/sh

FILE='/etc/cron.daily/backup'
DIR="/nas/safe/backups/$HOSTNAME"
mkdir -p "$DIR" &> /dev/null
touch "$FILE"
sudo echo "rsync -a --delete --quiet /home /nas/safe/backups/$HOSTNAME" > "$FILE"
echo "printing the contents of file: $FILE:"
cat "$FILE"
