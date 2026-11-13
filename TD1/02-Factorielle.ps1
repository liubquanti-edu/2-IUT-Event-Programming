# Calcule la factorielle de n

param(
    [int]$n
)

$resultat = 1

for ($i = 2; $i -le $n; $i++) {
    $resultat = $resultat * $i
}

Write-Host "La factorielle de $n est : $resultat"
