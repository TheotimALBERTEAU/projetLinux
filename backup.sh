mysqldump -u root -p'jojo' > db.sql
restic -r rclone:dropbox:Backups_uptime_kuma backup db.sql