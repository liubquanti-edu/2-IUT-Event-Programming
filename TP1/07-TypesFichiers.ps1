# (Bonus) Script qui prend en entrée un chemin de dossier et affiche
# la liste des types de fichiers (extensions) existants avec le nombre
# de fichiers de chaque type.
#
# Exemple : .\07-TypesFichiers.ps1 -Chemin "C:\Windows"

param(
    [Parameter(Mandatory = $true)]
    [string]$Chemin
)

if (-not (Test-Path -Path $Chemin -PathType Container)) {
    Write-Host "Erreur : le dossier '$Chemin' n'existe pas."
    exit
}

Get-ChildItem -Path $Chemin -File |
    Group-Object -Property Extension |
    Sort-Object -Property Count -Descending |
    ForEach-Object {
        $type = if ($_.Name -eq "") { "(sans extension)" } else { $_.Name }
        Write-Host "$type : $($_.Count) fichier(s)"
    }
