# 🛠️ Laboratoire Système & Réseau : Déploiement et Dépannage DHCP

Ce projet documente la mise en place d'un service d'adressage dynamique (**DHCP**) sous Debian 12, ainsi que la démarche méthodique de recette, de diagnostic et de résolution d'incidents associés.

---

## 🎯 Objectifs du Lab
* **Adressage fixe :** Configuration et sécurisation de l'interface réseau serveur en IP statique.
* **Déploiement :** Installation et paramétrage du service `isc-dhcp-server`.
* **Troubleshooting :** Analyse des logs système et correction des erreurs de syntaxe/configuration.
* **Recette :** Validation de la distribution des baux IP sur une machine cliente.

---

## 📂 Navigation & Documentation
* 📄 **[Consulter le rapport technique détaillé](./rapport-technique.md)** : Retrouvez l'intégralité des phases de test, les erreurs rencontrées, les analyses de logs et les configurations validées.

---

## 🧰 Commandes Clés & Outils
* `ip a` : Contrôle des interfaces et des attributions d'adresses.
* `systemctl` : Gestion du cycle de vie du service.
* `journalctl` : Inspection ciblée des erreurs du démon DHCP.
