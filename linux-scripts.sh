#Projet : Déploiement et configuration de GLPI sur un serveur Linux headless (sans interface graphique)

#Contexte technique : Mise en place d'une solution de gestion de services informatiques GLPI sur un serveur Debian distant (sans interface graphique / CLI)
#Cadre : Formation Systèmes et Réseaux (Studi) - Portfolio technique
# Description : Guide d'installation complet d'une solution ITSM/Helpdesk,
# incluant la pile LAMP, la base de données MariaDB, le durcissement de la sécurité des dossiers et la configuration du serveur web Apache.

#Instructions pour installer GLPI sous Debian
#1. Mettre à jour le système :
sudo apt update && sudo apt upgrade -y
#2. Installer la pile LAMP (Apache, MariaDB, PHP) :
sudo apt install apache2 mariadb-server php php-fpm -y
#Installer ensuite les extensions PHP indispensables au fonctionnement de GLPI :
sudo apt install php-mysql php-mbstring php-curl php-gd php-xml php-intl php
ldap php-apcu php-xmlrpc php-zip php-bz2 php-bcmath -y
(Redémarrer ou recharger Apache si nécessaire : 
#3. Créer et sécuriser la base de données
sudo mariadb
sudo systemctl restart apache2 )
Puis exécuter les commandes SQL suivantes pour créer une base de données dédiée et un
utilisateur avec les privilèges associés :
CREATE DATABASE glpivdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpiuser'@'localhost' IDENTIFIED BY 'TonMotDePasseSecurise';
GRANT ALL PRIVILEGES ON glpivdb.* TO 'glpiuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
#4. Télécharger et préparer GLPI :
cd /tmp
wget https://github.com/glpi-project/glpi/releases/download/<version>/glpi
<version>.tgz
#Décompresser l'archive dans le répertoire web d'Apache
sudo tar -xzvf glpi-<version>.tgz -C /var/www/
Attribuer la propriété des fichiers au serveur web
sudo chown -R www-data:www-data /var/www/glpi
#5. Sécuriser les dossiers de configuration (Recommandé) :
#Pour plus de sécurité, il est conseillé de déplacer les dossiers sensibles (config et files) en dehors de la racine Web
#a. Créer les répertoires hors de l'arborescence publique :
sudo mkdir /etc/glpi
sudo mkdir -p /var/lib/glpi/files
sudo mkdir /var/log/glpi
#b. Donner les bons droits à l'utilisateur web :
sudo chown -R www-data:www-data /etc/glpi /var/lib/glpi /var/log/glpi
#c. Déplacer les fichiers existants :
sudo cp -r /var/www/glpi/config/ /etc/glpi/
sudo cp -r /var/www/glpi/files/ /var/lib/glpi/files/
#d. Crée le fichier de liaison downstream.php dans 
sudo nano /var/www/glpi/inc/downstream.php
#puis ajoute le contenu suivant :
/var/www/glpi/inc/ :
<?php
define('GLPI_CONFIG_DIR', '/etc/glpi/');
if (file_exists(GLPI_CONFIG_DIR . '/local_define.php')) {
require_once GLPI_CONFIG_DIR . '/local_define.php';
}
#e. Crée le fichier 
#/etc/glpi/local_define.php pour pointer vers les bons répertoires :
sudo nano /etc/glpi/local_define.php
#Ajouter le contenu :
<?php
define('GLPI_VAR_DIR', '/var/lib/glpi/files');
define('GLPI_LOG_DIR', '/var/log/glpi');
#6. Configurer le serveur Web (Apache) :
#a. Créer un fichier de configuration VirtualHost pour GLPI :
sudo nano /etc/apache2/sites-available/glpi.conf
#b. Coder la configuration suivante (adapter ServerName selon l'environnement) :
<VirtualHost *:80>
ServerName glpi.mondomaine.lan
DocumentRoot /var/www/glpi
`<Directory /var/www/glpi>`
`Require all granted`
`AllowOverride All`
`Options -Indexes +FollowSymLinks`
`</Directory>`
`ErrorLog ${APACHE_LOG_DIR}/glpi_error.log`
`CustomLog ${APACHE_LOG_DIR}/glpi_access.log combined`
</VirtualHost>
#c.Activer le site, les modules nécessaires et recharge Apache :
sudo a2ensite glpi.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
#7. Finaliser l'installation via l'interface Web :
#Ouvrir le navigateur web et se rendre sur l'adresse du serveur (ex: 
http://<ip-du-serveur>
ou 
[http://glpi.mondomaine.lan](http://glpi.mondomaine.lan) )
#L'assistant d'installation de GLPI va se lancer :
#1. Choisir la langue.
#2. Accepter les termes de la licence.
#3. Cliquer sur Installer.
#4. Vérifier que tous les prérequis (extensions PHP, droits d'écriture) sont au vert.
#5. Renseigner les identifiants de la base de données créée à l'étape 3 (TonMotDePasseSecurise ).
#6. Sélectionner la base de données 
#glpivdb
#glpiuser 

#Bilan :
#Ce projet de déploiement m'a permis de valider les compétences clés suivantes :
#Maîtrise de l'environnement Linux (Debian) en ligne de commande (headless), sans interface graphique.

#Mise en œuvre d'une architecture web complète via l'installation d'une pile LAMP et le paramétrage d'un serveur web Apache (VirtualHost, modules de réécriture).

#Application des bonnes pratiques de sécurité (durcissement des accès MariaDB, dissociation des dossiers sensibles hors de la racine web).

#Compréhension d'un outil ITSM/Helpdesk (GLPI), de son installation par assistant Web jusqu'à la connexion à sa base de données dédiée.

