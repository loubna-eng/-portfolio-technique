## 🏰 Active Directory & Administration Windows

Cette section présente la configuration, la gestion et l'automatisation d'un environnement Active Directory Domain Services (AD DS) en laboratoire.

---

### 📂 Architecture & Organisation du Domaine

*Structure logique :* Création d'un domaine local de test et organisation des ressources via des *Unités d'Organisation (OU)** structurées par services (RH, IT, Finance, etc.).
*Gestion des identités et des accès (IAM) :
  * Création et administration des comptes utilisateurs, ordinateurs et groupes de sécurité.
  * Application du *principe du moindre privilège* pour l'attribution des droits d'accès aux ressources réseau.

---

### 📜 Stratégies de Groupe (GPO)

Mise en place de stratégies de groupe centralisées pour appliquer les règles de sécurité et homogénéiser la configuration des postes clients :

* **Sécurisation des postes :** Restriction d'accès aux paramètres système sensibles (Panneau de configuration, Invite de commandes).
  *Déploiement centralisé :* Configuration automatique des paramètres réseau, pare-feu et lecteurs réseau virtuels.
  *Méthodologie de dépannage (Troubleshooting) :
  * Diagnostic des règles appliquées sur les postes clients via la commande "gpresult /h report.html"
  * Force la réplication immédiate des stratégies modifiées avec "gpupdate /force"
---

### ⚡ Automatisation PowerShell & Gestion CSV

Afin d'optimiser l'intégration massive d'utilisateurs et de réduire les erreurs manuelles, un script d'automatisation PowerShell a été développé :

* **Importation des données :** Parsing de fichiers CSV structurés avec "Import csv".
* **Contrôle d'existence et anti-doublons :** Utilisation de boucles 'foreach`
*  (`if/else` couplé à `Get-ADUser`) pour valider l'unicité des identifiants (`SamAccountName`) avant création.
* **Sécurisation des secrets :** Conversion sécurisée des mots de passe temporaires au format `SecureString` exigé par AD DS.

```powershell
# Exemple de logique d'automatisation PowerShell (Extrait)
Import-Module ActiveDirectory

$Users = Import-Csv -Path "C:\temp\utilisateurs.csv" -Delimiter ";"

foreach ($User in$Users) {
    if (Get-ADUser -Filter "SamAccountName -eq '$($User.SamAccountName)'") {
        Write-Host "L'utilisateur $($User.SamAccountName) existe déjà." -ForegroundColor Yellow
    } else {
        # Création sécurisée du compte Active Directory
        New-ADUser -Name $User.DisplayName `
                   -SamAccountName $User.SamAccountName `
                   -UserPrincipalName $User.UPN `
                   -AccountPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force) `
                   -Enabled $true
    }
}
