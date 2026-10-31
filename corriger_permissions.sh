#!/bin/bash
# corriger_permissions.sh
# Applique la politique d'accès NovaTech sur /srv/novatech
# Usage : ./corriger_permissions.sh [--dry-run]

DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "=== MODE SIMULATION (dry-run) — aucune modification ne sera appliquée ==="
fi

# Format : chemin|groupe_cible|droits_cibles
REGLES=(
    "/srv/novatech/rh/salaires.csv|novatech_rh|640"
    "/srv/novatech/it/backup_db.sh|novatech_it|750"
    "/srv/novatech/direction/id_rsa|novatech_direction|600"
    "/srv/novatech/compta|novatech_compta|750"
    "/srv/novatech/direction/notes.txt|novatech_direction|640"
)

for regle in "${REGLES[@]}"; do
    IFS='|' read -r chemin groupe droits <<< "$regle"

    if [[ ! -e "$chemin" ]]; then
        echo "[ATTENTION] $chemin introuvable, ignoré."
        continue
    fi

    droits_actuels=$(stat -c "%a" "$chemin")
    groupe_actuel=$(stat -c "%G" "$chemin")

    echo "---"
    echo "Ressource : $chemin"
    echo "  Groupe actuel : $groupe_actuel -> cible : $groupe"
    echo "  Droits actuels : $droits_actuels -> cible : $droits"

    if $DRY_RUN; then
        echo "  [SIMULATION] chgrp $groupe $chemin"
        echo "  [SIMULATION] chmod $droits $chemin"
    else
        chgrp "$groupe" "$chemin" && echo "  [OK] groupe changé"
        chmod "$droits" "$chemin" && echo "  [OK] droits changés"
    fi
done

echo "---"
echo "Terminé."
