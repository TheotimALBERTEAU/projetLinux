# saving BDD kuma in db.sql
mysqldump -u root -p'mdp' --databases kuma > db.sql

# init repo
restic -r restic-repo init

# backup
restic -r restic-repo backup db.sql

# send data to dropbox
rclone copy restic-repo/ Backups_uptime_kuma:
