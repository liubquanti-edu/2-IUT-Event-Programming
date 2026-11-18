# Exercice 2.5 - Commande qui permet d'obtenir les travaux planifiés
# sur des ordinateurs distants.
#
# Get-ScheduledJob n'a pas de paramètre -ComputerName : on l'exécute à
# distance via PowerShell Remoting (WinRM doit être activé sur les
# machines cibles : Enable-PSRemoting).

$ordinateurs = "PC-01", "PC-02"   # à remplacer par les noms des machines

Invoke-Command -ComputerName $ordinateurs -ScriptBlock { Get-ScheduledJob }

# Alternative avec les tâches planifiées Windows (CIM) :
# $session = New-CimSession -ComputerName $ordinateurs
# Get-ScheduledTask -CimSession $session -TaskPath "\Microsoft\Windows\PowerShell\ScheduledJobs\"
