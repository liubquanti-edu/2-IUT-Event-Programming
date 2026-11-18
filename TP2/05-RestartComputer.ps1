# Exercice 1.5 - Que se passe-t-il si on crée un déclencheur qui exécute
# Restart-Computer à chaque fois que l'utilisateur rt_user se connecte ?
#
# Réponse :
# Dès que rt_user ouvre une session, le travail démarre et redémarre la
# machine. Après le redémarrage, rt_user se reconnecte (surtout si la
# connexion est automatique) => le travail se relance => nouveau redémarrage...
# On obtient une boucle infinie de redémarrages : la machine devient
# inutilisable pour cet utilisateur. Il faut alors se connecter avec un autre
# compte administrateur (ou en mode sans échec) pour supprimer le travail :
#   Unregister-ScheduledJob -Name "TP2-RestartRtUser"
# Remarque : sans -Force, Restart-Computer échoue si d'autres utilisateurs
# sont connectés ; avec -Force, le redémarrage est immédiat.
#
# NE PAS EXÉCUTER ! Le code est volontairement laissé en commentaire.

# $declencheur = New-JobTrigger -AtLogOn -User "rt_user"
# Register-ScheduledJob -Name "TP2-RestartRtUser" -Trigger $declencheur -ScriptBlock {
#     Restart-Computer -Force
# }
