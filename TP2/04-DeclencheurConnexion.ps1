# Exercice 1.4 - Déclencheur qui exécute un travail à chaque fois que
# l'utilisateur rt_user se connecte.
#
# Attention : rt_user n'existe pas. New-JobTrigger accepte n'importe quel
# nom (aucune vérification), mais Register-ScheduledJob échoue car le
# Planificateur de tâches ne peut pas résoudre le compte
# ("Le mappage entre les noms de compte et les ID de sécurité n'a pas été effectué").
# Pour que l'inscription réussisse, il faut d'abord créer l'utilisateur :
#   New-LocalUser -Name "rt_user" -NoPassword

$nom = "TP2-ConnexionRtUser"

Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

$declencheur = New-JobTrigger -AtLogOn -User "rt_user"
$declencheur   # le déclencheur lui-même est bien créé

try {
    Register-ScheduledJob -Name $nom -Trigger $declencheur -ErrorAction Stop -ScriptBlock {
        "rt_user s'est connecté le $(Get-Date)" |
            Out-File -FilePath "$env:TEMP\TP2-Connexion.log" -Append
    }
    Get-JobTrigger -Name $nom
}
catch {
    Write-Host "Impossible d'enregistrer le travail : $($_.Exception.Message)"
}
