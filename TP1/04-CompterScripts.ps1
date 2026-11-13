# Même comportement que la question précédente,
# mais on compte uniquement les scripts PowerShell (.ps1).
#
# Exemple : Get-ChildItem "C:\Scripts" | Compter-Scripts

function Compter-Scripts {
    param(
        [Parameter(ValueFromPipeline = $true)]
        $Element
    )

    begin {
        $nombre = 0
    }

    process {
        if (-not $Element.PSIsContainer -and $Element.Extension -eq ".ps1") {
            $nombre++
        }
    }

    end {
        Write-Host "Nombre de scripts PowerShell : $nombre"
    }
}

# Test
Get-ChildItem -Path $PSScriptRoot | Compter-Scripts
