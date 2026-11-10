# Crée un dictionnaire pour une attaque brute-force (exercice pédagogique)
# Paramètres :
#   -longueur : nombre de caractères du mot de passe
#   -type     : 1 = minuscules
#               2 = minuscules + majuscules
#               3 = minuscules + majuscules + chiffres
#               4 = minuscules + majuscules + chiffres + ponctuation
#
# ATTENTION : la taille du fichier grandit très vite.
# Tester typiquement avec 3 caractères seulement.

param(
    [int]$longueur,
    [int]$type
)

# On construit l'ensemble des caractères selon le type
$minuscules = "abcdefghijklmnopqrstuvwxyz".ToCharArray()
$majuscules = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray()
$chiffres   = "0123456789".ToCharArray()
$ponctuation = "!?.,;:/*-+".ToCharArray()

$caracteres = @()
$caracteres += $minuscules
if ($type -ge 2) { $caracteres += $majuscules }
if ($type -ge 3) { $caracteres += $chiffres }
if ($type -ge 4) { $caracteres += $ponctuation }

$fichier = "dictionnaire.txt"

# Fonction récursive qui génère toutes les combinaisons
function Generer {
    param(
        [string]$debut,
        [int]$reste
    )

    if ($reste -eq 0) {
        Add-Content -Path $fichier -Value $debut
        return
    }

    foreach ($c in $caracteres) {
        Generer -debut ($debut + $c) -reste ($reste - 1)
    }
}

# On vide le fichier avant de commencer
Set-Content -Path $fichier -Value $null

Generer -debut "" -reste $longueur

Write-Host "Dictionnaire généré dans le fichier : $fichier"
