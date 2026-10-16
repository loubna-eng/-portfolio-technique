Mise en place d’un système de sauvegarde automatisé
Vous travaillez  pour l’entreprise Syncforever spécialisée dans les services informatiques. L’un de vos clients, l’entreprise Mydata, vous a contacté pour mettre en place un système de sauvegarde automatisé. Les serveurs concernés sont :

DS-SERV1 : serveur principal hébergeant des données critiques (situé à l’adresse IP 192.168.88.174).

DS-SERV2 : serveur de sauvegarde distant (adresse IP 192.168.88.176).

Les utilisateurs de MyDada se plaignent de ne pas avoir de sauvegarde régulière et souhaitent automatiser la synchronisation des fichiers du répertoire /var/projets/ du serveur DS-SERV1 vers le répertoire /backups/projets/ du serveur DS-SERV2.

Votre mission est de :

Configurer une première sauvegarde manuelle pour vérifier la synchronisation avec Rsync.

Mettre en place une automatisation de la sauvegarde toutes les heures via Cron.
