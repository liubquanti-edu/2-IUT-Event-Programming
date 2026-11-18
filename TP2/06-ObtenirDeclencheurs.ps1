# Exercice 2.1 - Commande qui permet d'obtenir le(s) déclencheur(s)
# utilisé(s) pour définir le travail programmé RT-login.

Get-JobTrigger -Name "RT-login"

# Équivalent en passant par l'objet travail programmé :
# Get-ScheduledJob -Name "RT-login" | Get-JobTrigger
