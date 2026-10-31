# Audit des permissions : NovaTech SARL (avant correction)

| Fichier/Dossier | Propriétaire | Groupe | Droits actuels | Risque | Justification |
|---|---|---|---|---|---|
| /srv/novatech/rh/salaires.csv | root | novatech_rh | 666 (-rw-rw-rw-) | Critique | Données salariales lisibles et modifiables par tout utilisateur du système |
| /srv/novatech/it/backup_db.sh | root | root | 777 (-rwxrwxrwx) | Critique | Script exécutable et modifiable par tous, un attaquant pourrait y injecter du code exécuté par root |
| /srv/novatech/direction/id_rsa | root | novatech_direction | 644 (-rw-r--r--) | Critique | Clé privée SSH lisible par tout le monde, compromission d'identité possible |
| /srv/novatech/compta | root | novatech_compta | 777 (drwxrwxrwx) | Critique | N'importe qui peut créer/supprimer des fichiers dans le dossier comptabilité |
| /srv/novatech/direction/notes.txt | root | novatech_direction | 644 (-rw-r--r--) | Moyen | Notes confidentielles lisibles par tous les utilisateurs du système |
