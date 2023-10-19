#!/bin/bash

# Paramètres
backup_dir="/home/joanie/svg" 
site_dir="/var/www/html/"
db_user="joanie"
db_password="jenevousdiraispasmonmdp"
db_name="joanie"
vhosts_dir="/etc/apache2/sites-available/000-default.conf" 
certificates_dir="/etc/apache2/sites-available/default-ssl.conf" 
backup_file="$backup_dir/backup-$(date +\%Y\%m\%d\%H\%M\%S).tar.gz"


# Sauvegarde du site web
tar -czf $backup_file -C $site_dir .

# Sauvegarde de la base de données
mysqldump -u $db_user -p$db_password $db_name > $backup_dir/db.sql

# Sauvegarde des fichiers de conf
tar -czf $backup_dir/vhosts.tar.gz -C $vhosts_dir .

tar -czf $backup_dir/certificates.tar.gz -C $certificates_dir .

echo "Sauvegarde terminée : $backup_file"

0 * * * * /home/joanie/svg/backup.sh

