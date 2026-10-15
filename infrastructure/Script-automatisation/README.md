
⚙️ Automatisation PowerShell (Gestion Active Directory)

📌 Ce que fait ce script :

Importation de données : Il lit un fichier CSV contenant des informations d'utilisateurs en détectant automatiquement le séparateur (virgule ou point-virgule).

Création automatisée : Pour chaque ligne, il vérifie si le compte existe déjà, puis crée un profil utilisateur propre dans l'unité d'organisation (OU) Active Directory ciblée.

Sécurité & Conformité : Il attribue un mot de passe temporaire sécurisé, gère la limitation de la longueur du SamAccountName (20 caractères max) et force l'utilisateur à modifier son mot de passe lors de sa première connexion.
