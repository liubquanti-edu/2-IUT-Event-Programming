# Exercice 3.1 - Travail programmé EventLogBackup qui obtient les 100
# événements les plus récents des journaux Application et Security,
# exécuté tous les jours à 8h.
#
# Le journal Security n'est lisible qu'en administrateur : le travail
# est donc enregistré avec l'option RunElevated.

$nom = "EventLogBackup"

Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

$script = {
    $dossier = "$env:USERPROFILE\EventLogBackup"
    if (-not (Test-Path $dossier)) {
        New-Item -ItemType Directory -Path $dossier | Out-Null
    }
    $date = Get-Date -Format "yyyy-MM-dd"

    foreach ($journal in "Application", "Security") {
        $evenements = Get-EventLog -LogName $journal -Newest 100
        $evenements | Export-Csv -Path "$dossier\$journal-$date.csv" -NoTypeInformation -Encoding UTF8
        $evenements   # renvoyé aussi en sortie du travail (consultable avec Receive-Job)
    }
}

$declencheur = New-JobTrigger -Daily -At "08:00"
$options     = New-ScheduledJobOption -RunElevated

Register-ScheduledJob -Name $nom -Trigger $declencheur -ScheduledJobOption $options -ScriptBlock $script
