# Exercice 2.6 - Modifier le script exécuté par le travail planifié
# RT-login pour sauvegarder une copie des fichiers au lieu de
# sauvegarder uniquement leurs noms.

$nouveauScript = {
    # Un dossier de sauvegarde par jour
    $destination = "$env:USERPROFILE\RT-login-Backup\$(Get-Date -Format 'yyyy-MM-dd')"
    if (-not (Test-Path $destination)) {
        New-Item -ItemType Directory -Path $destination | Out-Null
    }
    Get-ChildItem -Path $env:USERPROFILE -File |
        Copy-Item -Destination $destination -Force
}

Set-ScheduledJob -Name "RT-login" -ScriptBlock $nouveauScript

# Vérification
(Get-ScheduledJob -Name "RT-login").Command
