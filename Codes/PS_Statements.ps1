$name = "Justin Bieber"
$number = 10
$computerName = "WEBSRV01"

IF($computerName -like "*AD*"){

    Write-Host "Active Directory"

} ELSEIF($computerName -like "*WEB*") {

    Write-Host "Web Server"
} ELSE {

    Write-Host "Noctive Directory!"
}