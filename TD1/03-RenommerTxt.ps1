# Trouve tous les fichiers .txt d'un répertoire et les renomme en .old

param(
    [string]$dossier
)

$fichiers = Get-ChildItem -Path $dossier -Filter "*.txt"

foreach ($fichier in $fichiers) {
    $nouveauNom = $fichier.Name -replace "\.txt$", ".old"
    Rename-Item -Path $fichier.FullName -NewName $nouveauNom
    Write-Host "$($fichier.Name) renommé en $nouveauNom"
}
