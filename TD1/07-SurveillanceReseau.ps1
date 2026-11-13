# Surveille le réseau local : envoie un ping à toutes les machines
# et remplit un tableau avec les machines joignables et un tableau
# avec les machines non joignables.
#
# On teste le réseau 192.168.1.0/24 (adresses 1 à 254).
# Modifier $base si votre réseau est différent.

$base = "192.168.1."

$joignables = @()
$nonJoignables = @()

for ($i = 1; $i -le 254; $i++) {
    $ip = $base + $i

    if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
        $joignables += $ip
    }
    else {
        $nonJoignables += $ip
    }
}

Write-Host "Machines joignables :"
$joignables

Write-Host ""
Write-Host "Machines NON joignables :"
$nonJoignables
