# Exercice 2.3 - Afficher le déclencheur de travail ayant comme ID 2.
#
# Chaque déclencheur (ScheduledJobTrigger) possède une propriété Id qui est
# son numéro au sein du travail (1, 2, 3...). Get-JobTrigger permet de le
# filtrer avec -TriggerId. On crée donc un travail avec deux déclencheurs.

$nom = "TP2-DeuxDeclencheurs"

Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

$t1 = New-JobTrigger -Daily -At "10:00"
$t2 = New-JobTrigger -Weekly -DaysOfWeek Wednesday -At "15:00"

Register-ScheduledJob -Name $nom -Trigger $t1, $t2 -ScriptBlock { Get-Date } | Out-Null

# Déclencheur ayant l'ID 2
Get-JobTrigger -Name $nom -TriggerId 2

# Même consigne avec un autre attribut : le nom du travail.
# On affiche les déclencheurs de tous les travaux avec le nom du travail
# auquel ils appartiennent, puis on filtre sur ce nom.
Get-ScheduledJob | ForEach-Object {
    $travail = $_.Name
    Get-JobTrigger -InputObject $_ |
        Select-Object @{ Name = "Travail"; Expression = { $travail } }, Id, Frequency, At, DaysOfWeek
} | Where-Object { $_.Travail -eq $nom } | Format-Table -AutoSize
