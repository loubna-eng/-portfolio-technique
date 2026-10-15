# Projet LAMP sur Debian (VM)

Ce dépôt documente la configuration d'un serveur **LAMP** (Linux, Apache, MySQL/MariaDB, PHP) sur une machine virtuelle Debian, réalisé dans le cadre d'un exercice d'administration système.

---

## 🛠️ Environnement Technique
* **Système d'exploitation :** Debian 12
* **Serveur Web :** Apache2 (`2.4+`)
* **Langage :** PHP `8.2`
* **Réseau :** NAT (`192.168.88.174/24`)

---
⚠️ 2. Problème rencontré et résolution
Symptôme
Malgré l'installation correcte d'Apache et de PHP, les fichiers .php s'affichaient sous forme de texte brut (ou le code source apparaissait directement) dans le navigateur au lieu d'être exécutés.

Cause
Conflit de priorité : Le fichier par défaut index.html était présent dans le dossier /var/www/html/. Sous Apache, un fichier HTML est servi en priorité par rapport à un fichier PHP si aucun ordre spécifique n'est défini.

