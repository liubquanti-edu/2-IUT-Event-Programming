# Fonction qui compte le nombre de fichiers et de répertoires d'un répertoire donné.
# On vérifie que le répertoire est bien passé en paramètre et qu'il est de type string.
#
# Exemple : Compter-Elements -Repertoire "C:\Windows"

function Compter-Elements {
    param(
        $Repertoire
    )

    # Vérifie que le paramètre a bien été passé
    if ($null -eq $Repertoire -or $Repertoire -eq "") {
        Write-Host "Erreur : aucun répertoire passé en paramètre."
        return
    }

    # Vérifie que le paramètre est de type string
    if ($Repertoire -isnot [string]) {
        Write-Host "Erreur : le paramètre doit être de type string."
        return
    }

    # Vérifie que le répertoire existe
    if (-not (Test-Path -Path $Repertoire -PathType Container)) {
        Write-Host "Erreur : le répertoire '$Repertoire' n'existe pas."
        return
    }

    $fichiers    = (Get-ChildItem -Path $Repertoire -File).Count
    $repertoires = (Get-ChildItem -Path $Repertoire -Directory).Count

    Write-Host "Répertoire  : $Repertoire"
    Write-Host "Fichiers    : $fichiers"
    Write-Host "Répertoires : $repertoires"
    Write-Host "Total       : $($fichiers + $repertoires)"
}

# Tests
Compter-Elements -Repertoire $PSScriptRoot
Compter-Elements                 # pas de paramètre
Compter-Elements -Repertoire 42  # pas une string
