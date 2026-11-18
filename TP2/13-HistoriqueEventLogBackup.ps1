# Exercice 3.2 - Récupérer le travail programmé EventLogBackup et
# afficher son historique d'exécution.

# Le travail programmé (définition)
Get-ScheduledJob -Name "EventLogBackup"

# Son historique d'exécution : chaque exécution est une instance de travail
# visible avec Get-Job (après Import-Module PSScheduledJob).
Import-Module PSScheduledJob
Get-Job -Name "EventLogBackup" | Format-Table Id, Name, State, PSBeginTime, PSEndTime -AutoSize

# Résultat de la dernière exécution :
# Get-Job -Name "EventLogBackup" | Select-Object -Last 1 | Receive-Job -Keep
