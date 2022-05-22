$PublicNetwork = Invoke-RestMethod -uri "https://ipinfo.io/json"
$PublicIP = Invoke-RestMethod -uri "http://ipv4.icanhazip.com"

Write-Output $PublicNetwork
