# for ( statement1; statement2; statement3 ) {
#
# }
# statement1 -> initialization
# statement2 -> condition
# statement3 -> operation (increment, decrement)

Write-Host "The for loop is started."

# stap 01 -> $index = 0
# stap 02 -> $index = 1
# stap 03 -> $index = 2
# stap 100 -> $index = 100
# stap 101 -> $index = 101 -> $index -le 100 = $False
for ( $index = 0; $index -le 100; $index = $index + 1) {
    Write-Host "Hello World"
}

Write-Host "The for loop is complete."


for ( $index = 0; $index -lt 100; $index = $index + 1) {
    Write-Host $index
}

$ram_capacity = Read-Host "RAM capacity for each VM"
$disk_capacity = Read-Host "Disk capacity for each VM"
$switch_name = Read-Host "Network switch name for each VM"

for ( $index = 0; $index -lt 3; $index = $index + 1) {

    $vhd_path = "C:\Sandbox\VM\VM_Disk_$index.vhdx"

    if(Test-Path $vhd_path){
        Write-Error "The VM already exists.."
    } else {
        New-VM -Confirm -Generation 2 -MemoryStartupBytes $ram_capacity -Name "VM_$index" -NewVHDPath "C:\Sandbox\VM\VM_Disk_$index.vhdx" -NewVHDSizeBytes $disk_capacity -Path "C:\Sandbox\VM\VM_$index" -SwitchName $switch_name 
    }
}

# Write-Host "Drukt iets af.."
# Read-Host "Lees iets uit de console (powershell, bash, cmd..): "
