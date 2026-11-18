# Exercice 3.3 - Récupérer le travail programmé EventLogBackup et
# supprimer immédiatement son historique d'exécution.

Get-ScheduledJob -Name "EventLogBackup" | Set-ScheduledJob -ClearExecutionHistory

# Vérification : plus aucune instance de travail
Import-Module PSScheduledJob
Get-Job -Name "EventLogBackup" -ErrorAction SilentlyContinue
