# Exercice 1.3 - Déclencheur qui exécute un travail tous les lundis
# et vendredis (le paramètre -At est obligatoire, ici 9h).

$nom = "TP2-LundiVendredi"

Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

$declencheur = New-JobTrigger -Weekly -DaysOfWeek Monday, Friday -At "09:00"

Register-ScheduledJob -Name $nom -Trigger $declencheur -ScriptBlock {
    "Exécution du $((Get-Date).DayOfWeek) le $(Get-Date)" |
        Out-File -FilePath "$env:TEMP\TP2-LundiVendredi.log" -Append
}

Get-JobTrigger -Name $nom
