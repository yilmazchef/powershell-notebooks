$WebUrl = Read-Host "Gist URL"
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($WebUrl))
