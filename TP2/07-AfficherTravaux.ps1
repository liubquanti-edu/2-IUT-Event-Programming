# Exercice 2.2 - Afficher tous les travaux programmés de la machine.

# Travaux programmés PowerShell (module PSScheduledJob)
Get-ScheduledJob | Format-Table Id, Name, Enabled, JobTriggers, Command -AutoSize

# Toutes les tâches planifiées Windows (y compris celles du système).
# Les travaux PowerShell se trouvent dans \Microsoft\Windows\PowerShell\ScheduledJobs\
Get-ScheduledTask | Format-Table TaskPath, TaskName, State -AutoSize
