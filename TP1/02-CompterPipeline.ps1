# Même fonction que la précédente mais en utilisant le pipeline :
# Get-ChildItem récupère le contenu du dossier et le passe à la fonction
# qui compte et affiche le nombre d'éléments reçus.
#
# Exemple : Get-ChildItem "C:\Windows" | Compter-ElementsPipeline

function Compter-ElementsPipeline {
    param(
        [Parameter(ValueFromPipeline = $true)]
        $Element
    )

    begin {
        $fichiers    = 0
        $repertoires = 0
    }

    process {
        if ($Element.PSIsContainer) {
            $repertoires++
        }
        else {
            $fichiers++
        }
    }

    end {
        Write-Host "Fichiers    : $fichiers"
        Write-Host "Répertoires : $repertoires"
        Write-Host "Total       : $($fichiers + $repertoires)"
    }
}

# Test
Get-ChildItem -Path $PSScriptRoot | Compter-ElementsPipeline
