# Exercice 1.2 - Déclencheur qui démarre un travail programmé
# tous les deux jours à 13h.

$nom = "TP2-DeuxJours"

Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

# -Daily avec -DaysInterval 2 => un jour sur deux
$declencheur = New-JobTrigger -Daily -DaysInterval 2 -At "13:00"

Register-ScheduledJob -Name $nom -Trigger $declencheur -ScriptBlock {
    "Exécution (tous les 2 jours à 13h) le $(Get-Date)" |
        Out-File -FilePath "$env:TEMP\TP2-DeuxJours.log" -Append
}

Get-JobTrigger -Name $nom
