# Exercice 1.1 - Déclencheur qui démarre un travail une seule fois
# à un temps bien déterminé, puis création du travail programmé associé.
#
# Remarque : les cmdlets *-ScheduledJob / *-JobTrigger (module PSScheduledJob)
# existent uniquement dans Windows PowerShell 5.1 et nécessitent une console
# lancée en tant qu'administrateur.

$nom = "TP2-UneFois"

# Si le travail existe déjà (exécution précédente), on le supprime
Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

# Déclencheur : une seule fois, dans 5 minutes
$declencheur = New-JobTrigger -Once -At (Get-Date).AddMinutes(5)

Register-ScheduledJob -Name $nom -Trigger $declencheur -ScriptBlock {
    "Travail exécuté une seule fois le $(Get-Date)" |
        Out-File -FilePath "$env:TEMP\TP2-UneFois.log" -Append
}

Get-JobTrigger -Name $nom
