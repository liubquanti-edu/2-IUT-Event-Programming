# Même comportement que la question précédente (pipeline),
# mais on compte uniquement les fichiers.
#
# Exemple : Get-ChildItem "C:\Windows" | Compter-Fichiers

function Compter-Fichiers {
    param(
        [Parameter(ValueFromPipeline = $true)]
        $Element
    )

    begin {
        $nombre = 0
    }

    process {
        # On ignore les répertoires
        if (-not $Element.PSIsContainer) {
            $nombre++
        }
    }

    end {
        Write-Host "Nombre de fichiers : $nombre"
    }
}

# Test
Get-ChildItem -Path $PSScriptRoot | Compter-Fichiers
