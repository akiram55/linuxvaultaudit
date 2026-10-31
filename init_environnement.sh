#!/bin/bash
# init_environnement.sh
# Recrée l'environnement NovaTech SARL avec permissions volontairement vulnérables
set -e

echo "=== Création des groupes ==="
groupadd novatech_rh 2>/dev/null || true
groupadd novatech_compta 2>/dev/null || true
groupadd novatech_direction 2>/dev/null || true
groupadd novatech_it 2>/dev/null || true

echo "=== Création de l'arborescence ==="
mkdir -p /srv/novatech/{rh,compta,direction,it}

echo "=== Création des fichiers ==="
echo "Nom,Poste,Salaire" > /srv/novatech/rh/salaires.csv
printf '#!/bin/bash\necho backup...\n' > /srv/novatech/it/backup_db.sh
ssh-keygen -t rsa -b 2048 -f /srv/novatech/direction/id_rsa -N "" -q -y > /dev/null 2>&1 || \
    ssh-keygen -t rsa -b 2048 -f /srv/novatech/direction/id_rsa -N "" -q
echo "Notes confidentielles direction" > /srv/novatech/direction/notes.txt

echo "=== Application des permissions vulnérables (volontaire) ==="
chmod 666 /srv/novatech/rh/salaires.csv
chown root:root /srv/novatech/it/backup_db.sh
chmod 777 /srv/novatech/it/backup_db.sh
chmod 644 /srv/novatech/direction/id_rsa
chmod 777 /srv/novatech/compta

echo "=== Attribution des groupes ==="
chgrp novatech_rh /srv/novatech/rh
chgrp novatech_compta /srv/novatech/compta
chgrp novatech_direction /srv/novatech/direction
chgrp novatech_it /srv/novatech/it

echo "=== Environnement NovaTech prêt dans /srv/novatech ==="
