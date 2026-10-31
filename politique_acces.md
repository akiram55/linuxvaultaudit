# Politique d'accès : NovaTech SARL

## Principes
- Moindre privilège : chaque groupe n'accède qu'à ce qui lui est nécessaire.
- Aucun fichier sensible ne doit être accessible en écriture par "autres" (other).
- Les clés privées ne doivent être lisibles que par leur propriétaire.
- Les scripts exécutables ne doivent être modifiables que par leur propriétaire/groupe technique.

## Règles par ressource

| Ressource | Propriétaire cible | Groupe cible | Droits cibles | Justification |
|---|---|---|---|---|
| /srv/novatech/rh/salaires.csv | root | novatech_rh | 640 (-rw-r-----) | Lecture/écriture réservées à RH, aucun accès pour les autres |
| /srv/novatech/it/backup_db.sh | root | novatech_it | 750 (-rwxr-x---) | Exécutable par le groupe IT seulement, pas d'écriture pour "autres" |
| /srv/novatech/direction/id_rsa | root | novatech_direction | 600 (-rw-------) | Clé privée : accès propriétaire uniquement |
| /srv/novatech/compta | root | novatech_compta | 750 (drwxr-x---) | Dossier accessible en écriture au groupe compta uniquement |
| /srv/novatech/direction/notes.txt | root | novatech_direction | 640 (-rw-r-----) | Lecture/écriture réservées à la direction |
