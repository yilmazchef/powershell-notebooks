# OPTIONEEL: Maak de code veilig, met param, zonder param, met documentatie
$json_file = Read-Host "Enter json file path"

Write-Host (Get-Item -Path $json_file).Extension

$is_valid = (Get-Item -Path $json_file).Extension -eq ".json"

Write-Host $is_valid

if($is_valid){
    Get-Content $json_file
}
