# (Bonus) Fonction qui récupère une liste de noms, vérifie si un compte
# utilisateur local existe pour chacun et renvoie la liste des comptes
# non existants. Une seconde fonction, utilisée via le pipeline,
# affiche le nombre de comptes inexistants.
#
# Exemple : Get-ComptesInexistants -Noms "Alice","Bob" | Afficher-Nombre

function Get-ComptesInexistants {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Noms
    )

    foreach ($nom in $Noms) {
        $compte = Get-LocalUser -Name $nom -ErrorAction SilentlyContinue
        if ($null -eq $compte) {
            # Le compte n'existe pas : on le renvoie dans le pipeline
            $nom
        }
    }
}

function Afficher-Nombre {
    param(
        [Parameter(ValueFromPipeline = $true)]
        $Element
    )

    begin   { $nombre = 0 }
    process { $nombre++ }
    end     { Write-Host "Nombre de comptes inexistants : $nombre" }
}

# Test
$noms = @("Administrateur", "Invité", $env:USERNAME, "CompteBidon1", "CompteBidon2")

Write-Host "Comptes inexistants :"
Get-ComptesInexistants -Noms $noms | ForEach-Object { Write-Host " - $_" }

Get-ComptesInexistants -Noms $noms | Afficher-Nombre
