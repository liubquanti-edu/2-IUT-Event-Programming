# Supprime les fichiers du dossier de backup 30 jours après leur ajout.
#
# Paramètre :
#   -backup : dossier de backup à nettoyer
#
# On se base sur la date de création du fichier dans le dossier.

param(
    [string]$backup
)

$limite = (Get-Date).AddDays(-30)

$fichiers = Get-ChildItem -Path $backup -File

foreach ($fichier in $fichiers) {
    if ($fichier.CreationTime -lt $limite) {
        Remove-Item -Path $fichier.FullName
        Write-Host "$($fichier.Name) supprimé (plus de 30 jours)"
    }
}
