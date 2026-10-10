
# Titre : Déploiement et configuration de Wiki.js sur Debian (Headless)
# Contexte : Formation Systèmes et Réseaux - Portfolio technique
# Description : Guide d'installation complet d'une solution de gestion des connaissances,
# incluant la mise à jour système, l'installation de Node.js, le téléchargement 
# de Wiki.js et la configuration du service systemd

#1. Partir sur un système propre, à jour et sécurisé avant d'installer de nouveaux composants.
sudo apt update && sudo apt upgrade -y
#2. L'installation des prérequis (Node.js)
#curl -fsSL [URL] télécharge un script officiel fourni par NodeSource depuis Internet de manière silencieuse (-s), 
#rapide et sécurisée.
#Son intérêt : Les versions de Node.js fournies par défaut dans Debian sont souvent très anciennes.
#Cette commande permet d'ajouter le dépôt officiel de NodeSource pour installer une version récente (la version 18)
#compatible avec Wiki.js.
#sudo -E bash - envoie ce script téléchargé directement dans l'interpréteur de commandes (bash) 
#pour l'exécuter en administrateur.
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
#3. Installe nodejs (le moteur) ainsi que build-essential 
#(des outils de compilation indispensables pour certains modules complémentaires de Node).
#Son intérêt : Fournir l'environnement de base indispensable pour faire tourner l'application.
sudo apt install -y nodejs build-essential
#4. Crée (mkdir) un dossier nommé wiki à l'intérieur du répertoire web standard /var/www/. 
#L'option -p évite les erreurs si le dossier /var/www/ n'existait pas.
#Son intérêt : Ranger proprement l'application dans l'arborescence classique des serveurs web sous Linux.
sudo mkdir -p /var/www/wiki
#5. Change de répertoire (cd pour Change Directory) pour se placer directement à l'intérieur du dossier 
#que l'on vient de créer
#Son intérêt : Toutes les commandes suivantes s'appliqueront directement dans ce dossier.
cd /var/www/wiki
#6. Télécharge (wget) l'archive compressée officielle de Wiki.js (version 2.5.304) directement
#depuis leur espace de stockage GitHub.
#Son intérêt : Récupérer le code source de l'application sur le serveur
sudo wget https://github.com/Requarks/wiki/releases/download/2.5.304/wiki-js.tar.gz
#7.Libérer de l'espace disque et rendre les fichiers de l'application accessibles.
#tar xzf décompresse l'archive tar.gz dans le dossier courant.
#rm supprime l'archive .tar.gz qui ne sert plus à rien une fois décompressée
sudo tar xzf wiki-js.tar.gz
sudo rm wiki-js.tar.gz
#8. Wiki.js a impérativement besoin d'un fichier config.yml pour savoir comment démarrer (port, base de données, etc.).
#Copie (cp) le fichier modèle de configuration (config.sample.yml) pour en faire un fichier actif nommé config.yml
sudo cp config.sample.yml config.yml
La création du service système (systemd)
#9.C'est une étape clé en administration système : elle permet de dire à Linux de gérer Wiki.js
#comme un service de fond (exactement comme un serveur web ou une base de données).
sudo bash -c 'cat > /etc/systemd/system/wiki.service <<EOF
[Unit]
Description=Wiki.js
After=network.target
[Service]
Type=simple
User=www-data
ExecStart=/usr/bin/node server.js
WorkingDirectory=/var/www/wiki
Restart=always
Environment=NODE_ENV=production
[Install]
WantedBy=multi-user.target
EOF'
#Crée un fichier de configuration pour le gestionnaire de services de Debian (/etc/systemd/system/wiki.service).
#User=www-data : Indique que l'application s'exécute avec un utilisateur restreint pour des raisons de sécurité.
#ExecStart=/usr/bin/node server.js : Indique à Linux quelle commande lancer pour démarrer le wiki.
#Restart=always : Force Linux à relancer automatiquement Wiki.js si le serveur plante ou redémarre.
#10.Le démarrage et l'activation du service
sudo systemctl daemon-reload
sudo systemctl enable wiki
sudo systemctl start wiki
#daemon-reload : Demande à Debian de prendre en compte le nouveau service qu'on vient de créer.
#enable wiki : Configure le service pour qu'il se lance automatiquement à chaque allumage de la machine.
#start wiki : Lance le service immédiatement
#Mettre l'application en route et s'assurer qu'elle survivra à un redémarrage du serveur.
