mysqldump -u root -p'mdp' --databases Backups_uptime_kuma > db.sql
restic -r rclone:dropbox:Backups_uptime_kuma backup db.sql
