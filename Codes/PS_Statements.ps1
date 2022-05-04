$name = "Justin Bieber"
$number = 10
$computerName = "AD001"
$ip = "1.1.1.99"

IF($computerName -like "*AD*" -and $ip -eq "1.1.1.5"){

    Write-Host "Active Directory"

} ELSEIF($computerName -like "*WEB*") {

    Write-Host "Web Server"
} ELSE {

    Write-Host "Noctive Directory!"
}