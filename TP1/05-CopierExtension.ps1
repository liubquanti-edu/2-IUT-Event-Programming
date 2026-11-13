# (Bonus) Fonction qui prend en entrée une extension (string), un répertoire
# source (string) et un emplacement de destination, puis copie dans la
# destination tous les fichiers ayant cette extension.
#
# Exemple : Copier-ParExtension -Extension "txt" -Repertoire "C:\Docs" -Destination "C:\Copie"

function Copier-ParExtension {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Extension,

        [Parameter(Mandatory = $true)]
        [string]$Repertoire,

        [Parameter(Mandatory = $true)]
        [string]$Destination
    )

    if (-not (Test-Path -Path $Repertoire -PathType Container)) {
        Write-Host "Erreur : le répertoire '$Repertoire' n'existe pas."
        return
    }

    # On accepte "txt" ou ".txt"
    if (-not $Extension.StartsWith(".")) {
        $Extension = "." + $Extension
    }

    # On crée le dossier de destination s'il n'existe pas
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination | Out-Null
    }

    $fichiers = Get-ChildItem -Path $Repertoire -File | Where-Object { $_.Extension -eq $Extension }

    foreach ($fichier in $fichiers) {
        Copy-Item -Path $fichier.FullName -Destination $Destination
        Write-Host "$($fichier.Name) copié vers $Destination"
    }

    Write-Host "$(@($fichiers).Count) fichier(s) copié(s)."
}

# Test
Copier-ParExtension -Extension "ps1" -Repertoire $PSScriptRoot -Destination "$env:TEMP\CopiePs1"
