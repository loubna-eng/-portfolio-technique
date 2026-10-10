
# 🐧 Services Linux : Déploiement & Administration (GLPI & Wiki.js)

Ce dossier regroupe les scripts et la documentation d'installation de deux services clés déployés sur serveur Linux (Debian/Ubuntu) pour la gestion de parc et la gestion des connaissances.

---

## 🟢 Bloc 1 : Déploiement de GLPI (Gestion de Parc IT & Helpdesk)

### 📌 Objectif
Mettre en place une solution ITSM (**GLPI**) permettant la gestion centralisée du parc informatique (inventaire matériel/logiciel) et la gestion des tickets d'assistance (Helpdesk).

### 🛠️ Fichier associé
* Script d'installation : [`./linux-scripts-GLPI.sh`](./linux-scripts-GLPI.sh) *(ou ajustez le nom exact du script)*

### 🔑 Démarche & Compétences mises en œuvre
* **Installation de la pile LAMP / LEMP :** Configuration de la base de données MySQL/MariaDB, du serveur web Apache et des extensions PHP requises par GLPI.
* **Sécurisation & Droits d'accès :** Configuration des dossiers de stockage (`files/`, `config/`), gestion des permissions Linux (`chown`, `chmod`) et création d'une base de données dédiée sécurisée.
* **Validation & Recette :** Vérification des prérequis lors de l'assistant d'installation web et initialisation des comptes d'administration.

---

## 🔵 Bloc 2 : Déploiement de Wiki.js (Gestion de la Connaissance)

### 📌 Objectif
Déployer une plateforme de documentation collaborative moderne (**Wiki.js**) pour centraliser les procédures techniques, les modes opératoires et la base de connaissances.

### 🛠️ Fichier associé
* Script d'installation : [`./linux-script-wikijs.sh`](./linux-script-wikijs.sh) *(ou ajustez le nom exact du script)*

### 🔑 Démarche & Compétences mises en œuvre
* **Déploiement & Environnement :** Installation des dépendances (Node.js, PostgreSQL/MariaDB) et configuration des services système (`systemd`) pour le lancement automatique au démarrage.
* **Configuration Réseau & Proxy :** Redirection de port, gestion des en-têtes web et sécurisation des accès.
* **Organisation du contenu :** Structuration des espaces de documentation et gestion des rôles/droits des utilisateurs.

---

## 💡 Lien avec la démarche Quality Assurance (QA)
La mise en place de ces deux services illustre l'importance de l'**environnement de travail** et de la **traçabilité** :
* **GLPI** permet le suivi et la qualification des incidents d'infrastructure (parallèle direct avec la gestion des bugs).
* **Wiki.js** garantit la pérennité et la clarté des modes opératoires (parallèle avec la rédaction des cahiers de test et des procédures QA).
