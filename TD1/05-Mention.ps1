# Prend la moyenne d'un étudiant et affiche son résultat et sa mention

param(
    [double]$moyenne
)

if ($moyenne -lt 10) {
    Write-Host "Moyenne de $moyenne : Ajourné (non admis)"
}
elseif ($moyenne -lt 12) {
    Write-Host "Moyenne de $moyenne : Admis - Mention Passable"
}
elseif ($moyenne -lt 14) {
    Write-Host "Moyenne de $moyenne : Admis - Mention Assez Bien"
}
elseif ($moyenne -lt 16) {
    Write-Host "Moyenne de $moyenne : Admis - Mention Bien"
}
else {
    Write-Host "Moyenne de $moyenne : Admis - Mention Très Bien"
}
