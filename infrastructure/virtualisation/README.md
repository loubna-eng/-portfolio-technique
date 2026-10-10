
## 🌐 LAB & Virtualisation

Cette section détaille la conception et la configuration de l'environnement de laboratoire virtuel utilisé pour simuler des infrastructures d'entreprise (Serveurs Active Directory, Linux LAMP, GLPI, etc.).

---

### 🖥️ Types d'Hyperviseurs

Dans le cadre de ces travaux pratiques, plusieurs types d'hyperviseurs ont été manipulés :

*Hyperviseurs de Type 2 (Hosted) : *Oracle VM VirtualBox* / *VMware Workstation*
  * Déploiement rapide de maquettes, de laboratoires de test et d'environnements d'expérimentation isolés sur une machine hôte.
  *Hyperviseurs de Type 1 (Bare-Metal) : *Proxmox VE / ESXi*
  * Compréhension de l'exécution directe sur le matériel (gestion optimisée des ressources, performances natives pour les environnements de production).

---

### 🌐 Modes de Connexion Réseau Virtuel

La segmentation et la connectivité des machines virtuelles (VM) s'appuient sur trois modes réseau principaux :

| Mode Réseau | Description & Usage |

| NAT (*Network Address Translation*) | La VM partage l'adresse IP de la machine hôte pour accéder à Internet. Utilisé pour les mises à jour logicielles de manière sécurisée. |
| Accès par Pont(*Bridge*) | La VM est intégrée directement sur le réseau physique local (obtient son adresse IP du routeur/DHCP local). Utilisé pour exposer des services accessibles depuis le réseau physique.
| Réseau Interne (*Host-Only / Custom*) | Réseau privé virtuel totalement isolé d'Internet. Utilisé pour faire communiquer le contrôleur de domaine Active Directory et ses clients en toute sécurité. |

---

# ⚙️ Paramètres de Configuration & Bonnes Pratiques

* Allocation des ressources :*Dimensionnement précis des ressources (vCPU, RAM fixe vs dynamique) pour garantir la stabilité de l'hôte et des VM.
* Format des disques virtuels :** Utilisation de disques à allocation dynamique (*Thin Provisioning*) pour optimiser l'espace de stockage.
* Gestion des Instantanés (*Snapshots*) : Prise d'un instantané système avant toute modification majeure (mises à jour, installation de services critiques), permettant un retour arrière immédiat (*rollback*) en cas de régression ou d'anomalie.

---

### 🔬 Synergie & Qualité (QA & Lab)

> La rigueur scientifique appliquée au laboratoire s'exprime ici par la traçabilité des configurations de VM et la capacité à reproduire des environnements de test identiques et isolés.
