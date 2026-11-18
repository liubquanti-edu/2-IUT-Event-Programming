# Exercice 2.4 - Travail planifié RT-login qui exécute un script qui
# enregistre une fois par jour les noms des fichiers contenus dans le
# répertoire de l'utilisateur dans un fichier log.

$nom = "RT-login"

Get-ScheduledJob -Name $nom -ErrorAction SilentlyContinue | Unregister-ScheduledJob

# Le script exécuté par le travail
$script = {
    $log = "$env:USERPROFILE\RT-login.log"
    "===== $(Get-Date) =====" | Out-File -FilePath $log -Append
    Get-ChildItem -Path $env:USERPROFILE -File |
        Select-Object -ExpandProperty Name |
        Out-File -FilePath $log -Append
}

$declencheur = New-JobTrigger -Daily -At "12:00"

Register-ScheduledJob -Name $nom -Trigger $declencheur -ScriptBlock $script

# Pour tester tout de suite sans attendre midi :
# (Get-ScheduledJob -Name $nom).StartJob()
