
#Script d'automatisation pour la création en masse d'utilisateurs dans l'Active Directory.
#Ce script importe un fichier CSV contenant des données utilisateurs, 
#crée chaque compte dans l'unité d'organisation (OU) spécifiée et définit un mot de passe temporaire
Import-Module ActiveDirectory
# Chemin vers le fichier CSV contenant la liste des utilisateurs
$CsvPath = "C:\Scripts\utilisateurs.csv"
# Unité d'organisation (OU) cible où les comptes seront créés
$TargetOU = "OU=Collaborateurs,DC=GreenTechSprint,DC=fr"
$DefaultPassword = ConvertTo-SecureString "P@ssword2026!" -AsPlainText -Force

# Auto-detection du separateur (virgule ou point-virgule)
$Header = Get-Content -Path$CsvPath -First 1
$Delimiter = if ($Header -like "*;*") { ";" } else { "," }

# Importer le fichier CSV
Import-Csv -Path $CsvPath -Delimiter$Delimiter | ForEach-Object {
    $Firstname =$_.Firstname
    $Lastname  =$_.Lastname
    $Username  =$_.Username

    if (-not $Username) { return }

    $UserPrincipalName = "$Username@greentechsprint.fr"
    
    # Tronquer le SamAccountName a 20 caracteres
    $SamName =$Username
    if ($SamName.Length -gt 20) {
        $SamName =$SamName.Substring(0, 20)
    }
    
    if (-not (Get-ADUser -Filter "UserPrincipalName -eq '$UserPrincipalName'")) {
        New-ADUser `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -DisplayName "$Firstname$Lastname" `
            -SamAccountName $SamName `
            -UserPrincipalName $UserPrincipalName `
            -Path $TargetOU `
            -AccountPassword $DefaultPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true
        
        Write-Host "Cree : $Lastname ($SamName)" -ForegroundColor Green
    } else {
        Write-Host "Le compte $UserPrincipalName existe deja." -ForegroundColor Yellow
    }
