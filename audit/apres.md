# Audit des permissions — NovaTech SARL (après correction)

| Fichier/Dossier | Propriétaire | Groupe | Droits avant | Droits après | Statut |
|---|---|---|---|---|---|
| /srv/novatech/rh/salaires.csv | root | novatech_rh | 666 | 640 (-rw-r-----) | ✅ Corrigé |
| /srv/novatech/it/backup_db.sh | root | novatech_it | 777 | 750 (-rwxr-x---) | ✅ Corrigé |
| /srv/novatech/direction/id_rsa | root | novatech_direction | 644 | 600 (-rw-------) | ✅ Corrigé |
| /srv/novatech/compta | root | novatech_compta | 777 | 750 (drwxr-x---) | ✅ Corrigé |
| /srv/novatech/direction/notes.txt | root | novatech_direction | 644 | 640 (-rw-r-----) | ✅ Corrigé |

## Vérification par audit automatisé

Les mêmes commandes `find` utilisées pour l'audit initial ont été relancées après correction :
find -perm -022 -type f → aucun résultat
find -perm -022 -type d → aucun résultat
find -perm -004 -name “id_rsa*” → aucun résultat

Toutes les anomalies détectées en phase d'audit initial ont été résolues.
