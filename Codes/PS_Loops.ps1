# for ( statement1; statement2; statement3 ) {
#
# }

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



for ( $index = 0; $index -lt 3; $index = $index + 1) {

    $vhd_path = "C:\Sandbox\VM\VM_Disk_$index.vhdx"

    if(Test-Path $vhd_path){
        Write-Error "The VM already exists.."
    } else {
        New-VM -Confirm -Generation 2 -MemoryStartupBytes 4GB -Name "VM_$index" -NewVHDPath "C:\Sandbox\VM\VM_Disk_$index.vhdx" -NewVHDSizeBytes 40GB -Path "C:\Sandbox\VM\VM_$index" -SwitchName "Default Switch" 
    }
}


