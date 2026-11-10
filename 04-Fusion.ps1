# Affiche la fusion imbriquée de deux chaînes
# Exemple : "janvier" et "avril" donne "jaavnrviiler"

param(
    [string]$chaine1,
    [string]$chaine2
)

$resultat = ""

# On parcourt jusqu'à la longueur de la plus longue chaîne
if ($chaine1.Length -gt $chaine2.Length) {
    $longueur = $chaine1.Length
} else {
    $longueur = $chaine2.Length
}

for ($i = 0; $i -lt $longueur; $i++) {
    if ($i -lt $chaine1.Length) {
        $resultat = $resultat + $chaine1[$i]
    }
    if ($i -lt $chaine2.Length) {
        $resultat = $resultat + $chaine2[$i]
    }
}

Write-Host $resultat
