# STEPS:
# 1) IMPORTANT: before running this script, the user must create ssh keys on the client (cyberman) and paste the public key to the authorized_keys file on the server (davros)
# More info at: https://coolestguidesontheplanet.com/make-passwordless-ssh-connection-osx-10-9-mavericks-linux/

# 2) update this script (the relative_paths variable)

# put here the RELATIVE paths of the files/folders to be backed up, white-space separated
relative_paths=("*")
cd /scratch/DGE/OGENETIC/$USER

for path in "${relative_paths[@]}"
do
	# backup from Cyberman to Davros:
	# rsync -aWvPru --relative $path davros-gw1:/scratch/DGE/OGENETIC/$USER/
	# backup to RDS:
	rsync -aWvPru --relative $path davros-gw1:/data/rds/DGE/DUDGE/OGENETIC/$USER
	# rsync -aWv $path /data/rds/DGE/DUDGE/OGENETIC/$USER
done

echo "Exiting..."


# 3) add a cronjob
# crontab -e
# 0 0 * * * sh /path/to/Miscellaneous/backup.sh
# or
# @daily sh /path/to/Miscellaneous/backup.sh
