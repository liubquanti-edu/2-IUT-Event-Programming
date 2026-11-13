# Recherche dans un dossier les fichiers non modifiés depuis une date
# donnée et les déplace vers un dossier de backup.
#
# Paramètres :
#   -dossier : dossier source à analyser
#   -date    : date limite (ex : "2026-01-01")
#   -backup  : dossier de destination
#
# Les fichiers modifiés AVANT cette date sont déplacés.

param(
    [string]$dossier,
    [datetime]$date,
    [string]$backup
)

# On crée le dossier de backup s'il n'existe pas
if (-not (Test-Path $backup)) {
    New-Item -ItemType Directory -Path $backup | Out-Null
}

$fichiers = Get-ChildItem -Path $dossier -File

foreach ($fichier in $fichiers) {
    if ($fichier.LastWriteTime -lt $date) {
        Move-Item -Path $fichier.FullName -Destination $backup
        Write-Host "$($fichier.Name) déplacé vers $backup"
    }
}
